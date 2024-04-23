import 'package:maulanaperpustakaan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maulanaperpustakaan/app/components/bookDetails.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFeff0d5)
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 30,
                left: 20,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.w500)
                                    .fontFamily,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                  top: 80,
                  left: 0,
                  bottom: 110,
                  right: 0,
                  child: SingleChildScrollView(scrollDirection: Axis.vertical,child: MyBookDetails(dataBookDetails: state!.state1!, dataUlasan: state.state2!,))),
              Positioned(
                bottom: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.PINJAM);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.01),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.08,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.009),
                          ),
                          child: Text('PINJAM BUKU',
                              style: TextStyle(
                                fontSize: 30,
                                  fontFamily: GoogleFonts.baloo2(
                                          fontWeight: FontWeight.bold)
                                      .fontFamily)),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: ()=>controller.addKoleksiBuku(),
                          child: Obx(
                            () => Icon(
                              Icons.bookmark,
                              size: 30,
                              color: controller.detailBuku.value.koleksi == true ? Colors.green : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
