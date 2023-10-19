import 'package:get/get.dart';

class LoginController extends GetxController{
  var loginMethod ="Number".obs;
  var validOtp=false.obs;

  bool validateMobile(String mobile) {
    String pattern = r'^[789]\d{9}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(mobile)&&mobile.length==10;
  }

  bool validateEmail(String email) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email)&&email.isNotEmpty;
  }

}
