
import 'package:get/get.dart';
import 'package:interview_test/data/api_client.dart';
import 'package:interview_test/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.sharedPreferences, required this.apiClient});

  Future<Response> getConfigData() async {
    Response response = await apiClient.postData('', {});
    return response;
  }

  Future<bool> initSharedData() {
    if(!sharedPreferences.containsKey(AppConstants.theme)) {
      return sharedPreferences.setBool(AppConstants.theme, false);
    }
    if(!sharedPreferences.containsKey(AppConstants.countryCode)) {
      return sharedPreferences.setString(AppConstants.countryCode, AppConstants.languages[0].countryCode);
    }
    if(!sharedPreferences.containsKey(AppConstants.languageCode)) {
      return sharedPreferences.setString(AppConstants.languageCode, AppConstants.languages[0].languageCode);
    }
    return Future.value(true);
  }

  Future<bool> removeSharedData() {
    return sharedPreferences.clear();
  }
}
