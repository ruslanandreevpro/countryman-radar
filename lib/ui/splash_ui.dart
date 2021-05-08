import 'package:countryman_radar/constants/constants.dart';
import 'package:countryman_radar/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';

class SplashUI extends StatelessWidget {
  final GlobalController _globalController = GlobalController.to;
  final AuthController _authController = AuthController.to;

  PhoneNumber number = PhoneNumber(isoCode: 'RU');

  @override
  Widget build(BuildContext context) {
    _globalController.initPackageInfo();

    return Scaffold(
      body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.height),
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 29, 15, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        "Радар Земляков".toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'RussoOne',
                          fontSize: 32.0,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Lottie.asset('assets/lottie/radar.json', width: 256.0, height: 256.0,),
                      Expanded(
                        child: Container(),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 24.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Для продолжения введите номер мобильного телефона. Мы отправим Вам одноразовый пароль на этот номер мобильного телефона",
                                    style: GoogleFonts.roboto(
                                      fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 24.0,
                                  ),
                                  InternationalPhoneNumberInput(
                                    hintText: 'Номер телефона',
                                    onInputChanged: (PhoneNumber number) {_authController.phoneNumber = number.phoneNumber!;},
                                    onInputValidated: (bool value) {},
                                    selectorConfig: SelectorConfig(
                                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                    ),
                                    ignoreBlank: true,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle: TextStyle(color: Colors.black),
                                    initialValue: number,
                                    textFieldController: _authController.phoneController,
                                    formatInput: true,
                                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                    inputBorder: InputBorder.none,
                                    onSaved: (PhoneNumber number) {},
                                    textAlign: TextAlign.right,
                                    textStyle: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            ElevatedButton(
                              onPressed: _authController.verifyPhoneNumber,
                              child: Text("Далее"),
                              style: ElevatedButton.styleFrom(
                                primary: AppThemes.lightTheme.primaryColor,
                                onPrimary: Colors.white,
                                textStyle: TextStyle(
                                  fontFamily: 'RussoOne',
                                  fontSize: 24.0,
                               ),
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                minimumSize: Size(290.0, 64.0),
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Text(
                              "Версия ${_globalController.packageInfo.version}",
                              style: GoogleFonts.roboto(
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      );
  }
}
