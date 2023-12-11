
import 'package:get/get.dart';
import 'package:interview_test/data/api_checker.dart';
import 'package:interview_test/feature/home/domain/model/trending_video_model.dart';
import 'package:interview_test/feature/home/domain/repo/home_repo.dart';

class HomeController extends GetxController implements GetxService {
  HomeRepo homeRepo;
  HomeController({required this.homeRepo});


  TrendingVideoModel? trendingVideoModel;
  Future<Response> getTrendingVideoList(int page) async {

    Response response = await homeRepo.getTrendingVideoList(page);
    if (response.statusCode == 200) {
      if(page == 1){
        trendingVideoModel = TrendingVideoModel.fromJson(response.body);
        update();
      }else{
        trendingVideoModel!.results!.addAll(TrendingVideoModel.fromJson(response.body).results!);
        trendingVideoModel!.page = TrendingVideoModel.fromJson(response.body).page;
        trendingVideoModel!.total = TrendingVideoModel.fromJson(response.body).total;
      }


    } else {
      ApiChecker.checkApi(response);
    }
    update();
    return response;
  }

}