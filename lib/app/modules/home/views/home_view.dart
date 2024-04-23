import 'package:maulanaperpustakaan/app/components/buildSection.dart';
import 'package:maulanaperpustakaan/app/components/navProfil.dart';
import 'package:maulanaperpustakaan/app/components/slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: widthFullBody,
        height: heightFullBody,
        child: controller.obx(
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              navProfil(
                title: controller.sapaanBerdasarkanWaktu(),
                image: "assets/profil.png",
                icon: FontAwesomeIcons.bell,
                subtitle: controller.username.value.toString(),
              ),
              MySlider(),
              Expanded(
                child: ColoredBox(color: const Color(0xFFeff0d5) ,child: buildSection(data: state!))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
