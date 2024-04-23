import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/pinjam_controller.dart';

class PinjamView extends GetView<PinjamController> {
  const PinjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Obx(
            () => Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(color: Color(0xFFeff0d5)),
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 1000),
                firstChild: MyPinjam(
                  controller: controller,
                ),
                secondChild: MyPinjamTrue(controller: controller),
                crossFadeState: controller.sucsesPeminjaman.value == false
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPinjam extends StatelessWidget {
  const MyPinjam({super.key, required this.controller});
  final PinjamController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Pinjam",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      overflow: TextOverflow.visible,
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w600)
                              .fontFamily,
                      fontSize: 17.0,
                      color: const Color(0xFF000000),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          controller.addPinjam();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.000000),
                          ),
                        ),
                        child: controller.loading.value
                            ? const CircularProgressIndicator()
                            : Text(
                                'PINJAM',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.baloo2(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 70,
          left: 20,
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .detailbookController
                                          .detailBuku
                                          .value
                                          .coverBuku
                                          .toString()),
                                      fit: BoxFit.fill)),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.detailbookController.detailBuku
                                        .value.judulBuku
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w700)
                                            .fontFamily,
                                        fontSize: 20),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 5),
                                Text(
                                    "Penulis : ${controller.detailbookController.detailBuku.value.penulisBuku.toString()}",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 13),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                    "Penerbit : ${controller.detailbookController.detailBuku.value.penerbitBuku.toString()}",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 13),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis),
                                Text(
                                    "Tahun Terbit : ${controller.detailbookController.detailBuku.value.tahunTerbit.toString()}",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 13),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama Peminjam",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500)
                                      .fontFamily,
                                  fontSize: 17),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            initialValue: controller.username,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.people),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF09142E)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF09142E)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tanggal Pinjam",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500)
                                      .fontFamily,
                                  fontSize: 17),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.date_range),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF09142E)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF09142E)),
                              ),
                            ),
                            initialValue:
                                "${controller.day} - ${controller.month} - ${controller.year}",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tanggal Kembali",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500)
                                      .fontFamily,
                                  fontSize: 17),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.date_range),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF09142E)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF09142E)),
                              ),
                            ),
                            initialValue:
                                "${controller.dayAfter} - ${controller.monthAfter} - ${controller.yearAfter}",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MyPinjamTrue extends StatelessWidget {
  const MyPinjamTrue({super.key, required this.controller});
  final PinjamController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF36969d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.000000),
                        ),
                      ),
                      child: Text(
                        'Kembali ke Halaman Buku',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily:
                                GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                                    .fontFamily),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 0,
          left: 20,
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.check_circle_outline_sharp,
                color: Color(0XFF36969d),
                size: 130,
              ),
              Text(
                "Peminjaman\nBerhasil",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.visible,
                  fontFamily: GoogleFonts.audiowide(fontWeight: FontWeight.w800)
                      .fontFamily,
                  fontSize: 32.0,
                  color: const Color(0xFF000000),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.detailbookController.detailBuku.value.coverBuku
                        .toString(),
                    height: 130,
                  )),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  controller.detailbookController.detailBuku.value.judulBuku
                      .toString(),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 27.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              Center(
                child: Text(
                  controller.detailbookController.detailBuku.value.penulisBuku
                      .toString(),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 20.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "${controller.detailbookController.detailBuku.value.penerbitBuku.toString()} / ${controller.detailbookController.detailBuku.value.tahunTerbit.toString()}",
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 20.0,
                    color: const Color.fromARGB(255, 127, 127, 127),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF888989),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "${controller.day.toString()}/${controller.month.toString()}/${controller.year.toString()} - ${controller.dayAfter.toString()}/${controller.monthAfter.toString()}/${controller.yearAfter.toString()}",
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 20.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "Terima Kasih telah meminjam ! \n Selamat Membaca",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.visible,
                  fontFamily: GoogleFonts.audiowide(fontWeight: FontWeight.w800)
                      .fontFamily,
                  fontSize: 17.0,
                  color: const Color(0xFF000000),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
