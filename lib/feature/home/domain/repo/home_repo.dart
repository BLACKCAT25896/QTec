
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:interview_test/data/api_client.dart';
import 'package:interview_test/util/app_constants.dart';

class HomeRepo{
  ApiClient apiClient;
  HomeRepo({required this.apiClient});

  Future<Response> getTrendingVideoList(int page) async {
    return await apiClient.getData('${AppConstants.trendingVideoUrl}$page');
  }

}