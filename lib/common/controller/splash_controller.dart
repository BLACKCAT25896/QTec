import 'package:get/get.dart';
import 'package:interview_test/common/repo/splash_repo.dart';
import 'package:interview_test/common/widget/custom_snackbar.dart';
import 'package:interview_test/data/api_checker.dart';

class SplashController extends GetxController {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});
  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<void> getConfigData() async {
    Response response = await splashRepo.getConfigData();
    if(response.hasError) {
      ApiChecker.checkApi(response);
    }else {
      showCustomSnackBar("${response.body}'");
    }
  }

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }




  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }
}
