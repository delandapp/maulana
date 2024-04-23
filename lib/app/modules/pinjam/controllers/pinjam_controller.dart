import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:maulanaperpustakaan/app/data/models/response_peminjaman.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maulanaperpustakaan/app/data/constans/endpoint.dart';
import 'package:maulanaperpustakaan/app/data/provider/api_provider.dart';
import 'package:maulanaperpustakaan/app/data/provider/storage_provider.dart';
import 'package:maulanaperpustakaan/app/modules/detailbook/controllers/detailbook_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maulanaperpustakaan/app/modules/history/controllers/history_controller.dart';

class PinjamController extends GetxController {
  //TODO: Implement PinjamController
  final DetailbookController detailbookController =
      Get.put(DetailbookController());
  final HistoryController historyController =
      Get.put(HistoryController());
  String get username => StorageProvider.read(StorageKey.username);
  int get day => DateTime.now().day;
  int get month => DateTime.now().month;
  int get year => DateTime.now().year;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime get oneWeekFromNow => DateTime.now().add(Duration(days: 7));
  int get dayAfter => oneWeekFromNow.day;
  int get monthAfter => oneWeekFromNow.month;
  int get yearAfter => oneWeekFromNow.year;
  final loading = false.obs;
  final sucsesPeminjaman = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  addPinjam() async {
    loading(true);

    try {
       final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      String data =
          jsonEncode({"BukuID": detailbookController.detailBuku.value.bukuID});
      FocusScope.of(Get.context!).unfocus();
      final response =
          await ApiProvider.instance().post(Endpoint.pinjam, data: data, options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (response.statusCode == 200) {
         final ResponsePeminjaman responsePeminjaman =
            ResponsePeminjaman.fromJson(response.data);
        if (responsePeminjaman.message.toString() == "Buku Masih Di Pinjam") {
          loading(false);
          Navigator.pop(Get.context!, 'OK');
          Get.snackbar("Information", "Maaf Buku Anda Belum Anda Kembalikan",
              backgroundColor: Colors.red);
          // Get.offAllNamed(Routes.LOGIN);
          _showMyDialog(
            () {
              Navigator.pop(Get.context!, 'OK');
            },
            "Pemberitahuan",
            "Buku Masih Di Pinjam",
            "Ok",
          );
          sucsesPeminjaman(false);
          return;
        }
        historyController.getDataHistory();
        sucsesPeminjaman(true);
        Get.snackbar("Information", "Peminjaman Succes",
            backgroundColor: Colors.green);
        // Get.offAllNamed(Routes.LOGIN);
      } else {
        sucsesPeminjaman(false);
        Get.snackbar("Sorry", "Peminjaman Gagal", backgroundColor: Colors.red);
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}

Future<void> _showMyDialog(
    final onPressed, String judul, String deskripsi, String nameButton) async {
  return showDialog<void>(
    context: Get.context!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0XFFFFFFFF),
        title: Text(
          'E-PERPUSTAKAAN',
          style: GoogleFonts.inriaSans(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
            color: const Color(0XFF162C9E),
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                judul,
                style: GoogleFonts.inriaSans(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 20.0),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                deskripsi,
                style: GoogleFonts.inriaSans(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            autofocus: true,
            style: TextButton.styleFrom(
              backgroundColor: const Color(0XFFE14892),
              animationDuration: const Duration(milliseconds: 300),
            ),
            onPressed: onPressed,
            child: Text(
              nameButton,
              style: GoogleFonts.inriaSans(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}
