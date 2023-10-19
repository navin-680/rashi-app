import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/screens/login/controllers/login_controller.dart';
import 'package:untitled1/screens/login/views/verify_otp_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  LoginController controller = Get.put(LoginController());
  final _textEditingController = TextEditingController();
  late FocusNode myFocusNode = FocusNode();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Phone Number",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            SizedBox(height: 8,),
            const Text(
              "You will gat a 4 digit OTP code for verification",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(height: 8,),
            Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.controller.loginMethod.value = "Number";
                        widget.myFocusNode.unfocus();
                        Future.delayed(const Duration(milliseconds: 50))
                            .then((value) {
                          widget.myFocusNode.requestFocus();
                        });
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: Get.width * 0.16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: widget.controller.loginMethod.value ==
                                      "Number"
                                  ? Colors.blue
                                  : Colors.grey[300]),
                          child: Text(
                            "Phone",
                            style: TextStyle(
                                color: widget.controller.loginMethod.value ==
                                        "Number"
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.controller.loginMethod.value = "Email";
                        widget.myFocusNode.unfocus();
                        Future.delayed(const Duration(milliseconds: 50))
                            .then((value) {
                          widget.myFocusNode.requestFocus();
                        });
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: Get.width * 0.16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  widget.controller.loginMethod.value == "Email"
                                      ? Colors.blue
                                      : Colors.grey[300]),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: widget.controller.loginMethod.value ==
                                        "Email"
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => SizedBox(
                height: 80,
                child: TextField(
                  controller: widget._textEditingController,
                  focusNode: widget.myFocusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: widget.controller.loginMethod == "Number"
                        ? "Enter Number"
                        : "Enter Email",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none, // Remove underline
                    ),
                  ),
                  maxLength: widget.controller.loginMethod.value == "Number"
                      ? 10
                      : 100,
                  keyboardType: widget.controller.loginMethod.value == "Number"
                      ? TextInputType.number
                      : TextInputType.emailAddress,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (widget.controller.loginMethod.value == "Number") {
                  if (widget.controller
                      .validateMobile(widget._textEditingController.text)) {
                    Get.to(OtpVerificationWidget());
                  }else{
                    Get.snackbar("Invalid Number ", "Please Enter valid phone number");
                  }
                } else {
                  if (widget.controller
                      .validateEmail(widget._textEditingController.text)) {
                    Get.to(OtpVerificationWidget());
                  }
                  else{
                    Get.snackbar("Invalid Email ", "Please Enter Valid Email");
                  }
                }
              },
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
