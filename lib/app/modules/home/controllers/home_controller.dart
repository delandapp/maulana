import 'package:maulanaperpustakaan/app/data/constans/endpoint.dart';
import 'package:maulanaperpustakaan/app/data/models/response_buku.dart';
import 'package:maulanaperpustakaan/app/data/provider/api_provider.dart';
import 'package:maulanaperpustakaan/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<DataBuku>>{
  //TODO: Implement HomeController
  
  final RxString username = StorageProvider.read(StorageKey.username).obs;
  final RxInt currentPage = 0.obs;
  RxList<Map<String, String>>  splashData = [
    {
      "image": "splash-1.png",
    },
    {
      "image": "splash-1.png",
    },
    {
      "image": "splash-1.png",
    },
  ].obs;
  final List<Map<String, dynamic>> listData = [];



  @override
  void onInit() {
    getData();
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
  Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        final response = await ApiProvider.instance().get(Endpoint.book,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        if (response.statusCode == 200) {
          final ResponseBuku responseBook = ResponseBuku.fromJson(response.data);
          print(response);
          if(responseBook.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(responseBook.data, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
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
}
