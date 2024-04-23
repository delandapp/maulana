import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:maulanaperpustakaan/app/data/constans/endpoint.dart';
import 'package:maulanaperpustakaan/app/data/models/response_bookmark_book.dart';
import 'package:maulanaperpustakaan/app/data/provider/api_provider.dart';
import 'package:maulanaperpustakaan/app/data/provider/storage_provider.dart';
import 'package:maulanaperpustakaan/app/modules/home/controllers/home_controller.dart';

class BookmarkController extends GetxController
    with StateMixin<List<DataBookmark>> {
  //TODO: Implement BookmarkController
  String idUser = StorageProvider.read(StorageKey.idUser);
  final loading = false.obs;
  final HomeController homeController = Get.put(HomeController());
  RxBool dataBookmark = false.obs;
  RxInt jumlahData = 0.obs;
   final RxString username = StorageProvider.read(StorageKey.username).obs;
  RxList<DataBookmark> listKoleksi = <DataBookmark>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataKoleksi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String sapaanBerdasarkanWaktu() {
    var jam = DateTime.now().hour;
    if (jam >= 4 && jam < 10) {
      return 'Selamat Pagi';
    } else if (jam >= 10 && jam < 15) {
      return 'Selamat Siang';
    } else if (jam >= 15 && jam < 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  void increment() => count.value++;
  deleteKoleksi(int idbook) async {
    loading(true);
    final bearerToken = StorageProvider.read(StorageKey.bearerToken);
    try {
      final response = await ApiProvider.instance().delete(
          '${Endpoint.koleksi}/$idbook',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        loading(false);
        homeController.getData();
        jumlahData.value = jumlahData.value - 1;
      } else {
        change(null, status: RxStatus.error("Gagal Menghapus Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        loading(false);
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
          loading(false);
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    }
  }

  Future<void> getDataKoleksi() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseKoleksiBuku = await ApiProvider.instance().get(
          '${Endpoint.koleksi}/$idUser',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseKoleksiBuku.statusCode == 200) {
        final ResponseBookmarkBook responseKoleksi =
            ResponseBookmarkBook.fromJson(responseKoleksiBuku.data);
        if (responseKoleksi.data!.isEmpty) {
          change(responseKoleksi.data, status: RxStatus.success());
          dataBookmark.value = true;
        } else {
          dataBookmark.value = false;
          change(responseKoleksi.data, status: RxStatus.success());
          listKoleksi.value = responseKoleksi.data!;
          jumlahData.value = responseKoleksi.data!.length;
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['Message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
