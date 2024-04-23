import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maulanaperpustakaan/app/data/constans/constans.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.widthFullBody,
    required this.label,
    this.color,
    required this.width,
    required this.height,
    required this.onTap,
    required this.controller
  });

  final double widthFullBody;
  final String label;
  final int? color;
  final double width;
  final double height;
  final Function()? onTap;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(onPressed: onTap, child: Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      child: controller.loading.value?CircularProgressIndicator(): AutoSizeText(
        label,
        style: TextStyle(fontSize: widthFullBody * 0.04,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.bold),
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(color??buttonFillColor)
      ),
    ));
  }
}