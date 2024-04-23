import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:maulanaperpustakaan/app/data/constans/endpoint.dart';
import 'package:maulanaperpustakaan/app/data/models/response_history_peminjaman.dart';
import 'package:maulanaperpustakaan/app/data/provider/api_provider.dart';
import 'package:maulanaperpustakaan/app/data/provider/storage_provider.dart';

class HistoryController extends GetxController
    with StateMixin<List<DataHistoryPeminjaman>> {
  //TODO: Implement BookmarkController
  String idUser = StorageProvider.read(StorageKey.idUser);
  final loading = false.obs;
  RxBool dataHistoryPeminjaman = false.obs;
  RxInt jumlahData = 0.obs;
  final RxString username = StorageProvider.read(StorageKey.username).obs;
  RxList<DataHistoryPeminjaman> listHistory = <DataHistoryPeminjaman>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataHistory();
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
  deleteHistory(int idbook) async {
    loading(true);
    final bearerToken = StorageProvider.read(StorageKey.bearerToken);
    try {
      final response = await ApiProvider.instance().delete(
          '${Endpoint.pinjam}/$idbook',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        loading(false);
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

  Future<void> getDataHistory() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final responseHistoryPeminjaman = await ApiProvider.instance().get(
          Endpoint.pinjam,
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      if (responseHistoryPeminjaman.statusCode == 200) {
        final ResponseHistoryPeminjaman responseHistory =
            ResponseHistoryPeminjaman.fromJson(responseHistoryPeminjaman.data);
        if (responseHistory.data!.isEmpty) {
          change(responseHistory.data, status: RxStatus.success());
          dataHistoryPeminjaman.value = true;
        } else {
          dataHistoryPeminjaman.value = false;
          change(responseHistory.data, status: RxStatus.success());
          listHistory.value = responseHistory.data!;
          jumlahData.value = responseHistory.data!.length;
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
