import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:maulanaperpustakaan/app/data/constans/endpoint.dart';
import 'package:maulanaperpustakaan/app/data/models/response_laporan.dart';
import 'package:maulanaperpustakaan/app/data/provider/api_provider.dart';
import 'package:maulanaperpustakaan/app/data/provider/storage_provider.dart';

class MyState<T1> {
  T1? state1;
  // T3? state3;
  MyState({this.state1});
}

class PinjamhistoryController extends GetxController
    with StateMixin<MyState<DataLaporan>> {
  //TODO: Implement PinjamHistoryController

  final count = 0.obs;
  final id = Get.parameters['idPinjam'];
  @override
  void onInit() {
    super.onInit();
    getData();
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

  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final bearerToken = StorageProvider.read(StorageKey.bearerToken);
      final response = await ApiProvider.instance().get(
          '${Endpoint.pinjam}/${id}',
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        final ResponseLaporan responseLaporan =
            ResponseLaporan.fromJson(response.data);

        final newData = MyState(state1: responseLaporan.data);
        change(newData, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
