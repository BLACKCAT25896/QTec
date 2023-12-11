

import 'package:interview_test/common/model/language_model.dart';
import 'package:interview_test/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages() {
    return AppConstants.languages;
  }
}
