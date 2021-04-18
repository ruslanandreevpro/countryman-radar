import 'package:countryman_radar/controllers/controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

void otpVerification() {
  final AuthController _authController = Get.find<AuthController>();

  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        height: Get.height / 3,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // верхняя часть
            Expanded(
              child: Text(
                'Введите 6-значный проверочный код, отправленный на ваш номер',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // центральная часть
            Expanded(
              child: Container(
                child: PinCodeTextField(
                  autofocus: true,
                  controller: _authController.otpController,
                  hideCharacter: true,
                  highlight: true,
                  highlightColor: Color.fromRGBO(0, 29, 15, 0.85),
                  defaultBorderColor: Colors.black,
                  hasTextBorderColor: Color.fromRGBO(0, 29, 15, 0.85),
                  highlightPinBoxColor: Color.fromRGBO(0, 29, 15, 0.85),
                  maxLength: 6,
                  onTextChanged: (text) {},
                  onDone: (text) {},
                  pinBoxWidth: 32,
                  pinBoxHeight: 64,
                  pinBoxBorderWidth: 1.0,
                  hasUnderline: false,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 22.0, color: Colors.white,),
                  pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
                  highlightAnimationBeginColor: Colors.white,
                  highlightAnimationEndColor: Colors.white12,
                  keyboardType: TextInputType.number,
                ),
              ),
              flex: 2,
            ),

            // нижняя часть
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  AuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: _authController.verificationID,
                      smsCode: _authController.otpController.text);
                  _authController
                      .signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                child: Text("Проверить".toUpperCase()),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 29, 15, 0.85),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  elevation: 5.0,
                  minimumSize: Size(210.0, 48.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    arguments: {},
    barrierDismissible: false,
  );
}
