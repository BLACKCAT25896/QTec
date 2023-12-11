

import 'package:interview_test/common/model/language_model.dart';
import 'package:interview_test/util/images.dart';

class AppConstants {
  static const String appName = 'QTec';
  static const String baseUrl = 'https://test-ximit.mahfil.net';
  static const String trendingVideoUrl = '/api/trending-video/1?page=';





  // Shared Key
  static const String theme = 'theme';
  static const String token = 'token';
  static const String deviceToken = 'deviceToken';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cartList = 'cart_list';
  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String searchAddress = 'search_address';
  static const String localization = 'X-Localization';
  static const String topic = 'notify';
  static const String zoneId = 'zoneId';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: '', languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];

  static const int limitOfPickedIdentityImageNumber = 2;
  static const double limitOfPickedImageSizeInMB = 2;
  static const double completionArea = 500;


}
