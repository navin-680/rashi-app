import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:get/get.dart';
import 'package:untitled1/screens/login/controllers/login_controller.dart';
import 'package:untitled1/screens/topic%20selection/views/topic_selection_page.dart';

class OtpVerificationWidget extends StatefulWidget {
  OtpVerificationWidget({super.key});

  LoginController controller = Get.find();

  @override
  _OtpVerificationWidgetState createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  TextEditingController _pinEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verify your ${widget.controller.loginMethod}",
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Please enter the 4-digit OTP code for verification",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => PinInputTextField(
                pinLength: 4,
                // Set the length of the OTP
                decoration: BoxLooseDecoration(
                  strokeColorBuilder: PinListenColorBuilder(
                      Colors.grey[300]!, Colors.grey[300]!),
                  bgColorBuilder: PinListenColorBuilder(
                      Colors.grey[300]!, Colors.grey[300]!),
                  strokeWidth: 1,
                  errorText: widget.controller.validOtp.value
                      ? "Wrong code please try again"
                      : null,
                  gapSpace: 10,
                  radius: const Radius.circular(10),
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                controller: _pinEditingController,
                autoFocus: true,
                textInputAction: TextInputAction.done,
                onSubmit: (pin) {
                  if (pin == "4444") {
                    widget.controller.validOtp.value = false;
                    Get.offAll(TopicSelectionPage());
                  }else{
                    widget.controller.validOtp.value = true;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (_pinEditingController.text == "4444") {
                  widget.controller.validOtp.value = false;
                  Get.offAll(TopicSelectionPage());
                }
                else{
                  widget.controller.validOtp.value = true;

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
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Didn't receive OTP?"),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Resend code",
              style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _pinEditingController.dispose();
    super.dispose();
  }
}
