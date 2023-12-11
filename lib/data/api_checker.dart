
import 'package:get/get.dart';
import 'package:interview_test/common/widget/custom_snackbar.dart';
import 'package:interview_test/data/error_response.dart';


class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {


    }else if(response.statusCode == 403){
      ErrorResponse errorResponse;
      errorResponse = ErrorResponse.fromJson(response.body);
      if(errorResponse.errors != null && errorResponse.errors!.isNotEmpty){
        showCustomSnackBar(errorResponse.errors![0].message!);
      }else{
        showCustomSnackBar(response.body['message']!);
      }

    }else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
