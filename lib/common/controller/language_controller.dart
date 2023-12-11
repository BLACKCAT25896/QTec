
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interview_test/common/model/language_model.dart';
import 'package:interview_test/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final SharedPreferences sharedPreferences;
  LanguageController({required this.sharedPreferences});

  int _selectIndex = 0;
  int get selectIndex => _selectIndex;

  void setSelectIndex(int index) {
    _selectIndex = index;
    update();
  }

  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;

  void searchLanguage(String query, BuildContext context) {
    if (query.isEmpty) {
      _languages.clear();
      _languages = AppConstants.languages;
      update();
    } else {
      _selectIndex = -1;
      _languages = [];
      for(int i=0; i< AppConstants.languages.length; i++){
        if (AppConstants.languages[i].languageName.toLowerCase().contains(query.toLowerCase())) {
          _languages.add(AppConstants.languages[i]);
        }
      }
      update();
    }
  }

  void initializeAllLanguages(BuildContext context) {
    if (_languages.isEmpty) {
      _languages.clear();
      _languages = AppConstants.languages;
    }
  }
}
