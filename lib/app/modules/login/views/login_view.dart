import 'package:maulanaperpustakaan/app/components/myButton.dart';
import 'package:maulanaperpustakaan/app/components/myInput.dart';
import 'package:maulanaperpustakaan/app/data/constans/validation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_validator/form_validator.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
  ValidationBuilder confirmPassword(TextEditingController controller) {
    return this
      ..add((value) {
        if (value != controller.text.toString()) {
          return 'Passwords do not match';
        }
        return null;
      });
  }
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final heightFullBody = MediaQuery.of(context).size.height;
    final widthFullBody = MediaQuery.of(context).size.width;
    return LoginMobile(
      widthFullBody: widthFullBody,
      heightFullBody: heightFullBody,
      controller: controller,
      isLandscape: isLandscape,
    );
  }
}

class LoginMobile extends StatelessWidget {
  const LoginMobile(
      {super.key,
      required this.widthFullBody,
      required this.heightFullBody,
      required this.controller,
      required this.isLandscape});

  final bool isLandscape;
  final double widthFullBody;
  final double heightFullBody;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFeff0d5),
            width: widthFullBody * 1,
            height: heightFullBody * 1,
            padding: EdgeInsets.symmetric(
                vertical: heightFullBody * 0.04,
                horizontal: widthFullBody * 0.07),
            child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/logo.png",width: 200,),
                          ],
                        )),
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700)
                                    .fontFamily),
                          ),
                          myInput(
                            validator: validator,
                            controller: controller,
                            controllerField: controller.email,
                            hintText: "Email",
                            autoFocus: true,
                            prefixIcon: FontAwesomeIcons.user,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700)
                                    .fontFamily),
                          ),
                          myInput(
                            isPassword: true,
                            validator: validatorPassword,
                            controller: controller,
                            controllerField: controller.password,
                            hintText: "password",
                            autoFocus: false,
                            prefixIcon: FontAwesomeIcons.key,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    MyButton(
                        widthFullBody: widthFullBody,
                        label: "Login",
                        width: widthFullBody * 0.2,
                        height: heightFullBody * 0.03,
                        onTap: () => controller.login(),
                        controller: controller),
                    const Expanded(flex: 4, child: SizedBox()),
                    SizedBox(
                      width: widthFullBody * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FittedBox(
                            child: Text('Don' + "'" + 't have an account?'),
                          ),
                          FittedBox(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.REGISTER);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}

class ButtonPotrait extends StatelessWidget {
  const ButtonPotrait({
    super.key,
    required this.widthFullBody,
    required this.heightFullBody,
    required this.controller,
  });

  final double widthFullBody;
  final double heightFullBody;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: widthFullBody * 0.85,
          height: heightFullBody * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff09142E),
                shape: const StadiumBorder()),
            onPressed: () {
              controller.login();
            },
            child: controller.loading.value
                ? CircularProgressIndicator()
                : Text(
                    "Sign In",
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w900),
                  ),
          ),
        ),
        SizedBox(
          height: heightFullBody * 0.02,
        ),
        SizedBox(
          width: widthFullBody * 0.85,
          height: heightFullBody * 0.07,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff09142E)),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: const StadiumBorder()),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.orange,
            ),
            label: Text(
              "Sign in with google",
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}

class ButtonLandscape extends StatelessWidget {
  const ButtonLandscape({
    super.key,
    required this.widthFullBody,
    required this.heightFullBody,
  });

  final double widthFullBody;
  final double heightFullBody;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: widthFullBody * 0.4,
          height: heightFullBody * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff09142E),
                shape: const StadiumBorder()),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          height: heightFullBody * 0.02,
        ),
        SizedBox(
          width: widthFullBody * 0.4,
          height: heightFullBody * 0.07,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xff09142E)),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: const StadiumBorder()),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.orange,
            ),
            label: Text(
              "Sign in with google",
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
