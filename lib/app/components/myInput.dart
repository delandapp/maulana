import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/constans/constans.dart';

class myInput extends StatelessWidget {
  const myInput(
      {super.key,
      required this.controller,
      required this.controllerField,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.isPassword = false,
      this.autoFocus = false,
      this.validator,
      this.textAlign = TextAlign.left});
  final controller;
  final TextEditingController controllerField;
  final validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final bool autoFocus;
  final String hintText;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return isPassword
        ? Obx(() => TextFormField(
            validator: validator,
            controller: controllerField,
            obscureText: controller.isObsure.value,
            autofocus: autoFocus,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    size: 18,
                    prefixIcon,
                    color: Colors.black,
                  ),
                ],
              ),
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.isObsure.value = !controller.isObsure.value;
                    },
                    child: FaIcon(
                      size: 18,
                      (controller.isObsure.value) == true
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              filled: true,
              fillColor: const Color(0xffFFFFFF),
              errorStyle: const TextStyle(
                color: errorInputColor,
              ),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor,width: 2)),
              // border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide:
                      const BorderSide(color: focusInputColor, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(color: enableInputColor)),
            )))
        : TextFormField(
            validator: validator,
            controller: controllerField,
            autofocus: true,
            textAlign: textAlign,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    size: 18,
                    suffixIcon,
                    color: Colors.black,
                  ),
                ],
              ),
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    size: 18,
                    prefixIcon,
                    color: Colors.black,
                  ),
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              filled: true,
              fillColor: const Color(0xffFFFFFF),
              errorStyle: const TextStyle(
                color: errorInputColor,
              ),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: errorInputColor,width: 2)),
              // border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide:
                      const BorderSide(color: focusInputColor, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(color: enableInputColor)),
            ));
  }
}
