/// Status : 200
/// Message : "Berhasil Menampilkan Ulasan"
/// data : [{"UlasanID":1,"Username":"DelandAPP","judul_buku":"After Hourse","penulis_buku":"Anisa Ramadani","penerbit_buku":"Athila davin","rating":5,"ulasan":"Buku ini sangat menjijikan"},{"UlasanID":2,"Username":"ryan fahrezi","judul_buku":"After Hourse","penulis_buku":"Anisa Ramadani","penerbit_buku":"Athila davin","rating":1,"ulasan":"jelek"}]

class ResponseUlasan {
  ResponseUlasan({
      this.status, 
      this.message, 
      this.data,});

  ResponseUlasan.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataUlasan.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataUlasan>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UlasanID : 1
/// Username : "DelandAPP"
/// judul_buku : "After Hourse"
/// penulis_buku : "Anisa Ramadani"
/// penerbit_buku : "Athila davin"
/// rating : 5
/// ulasan : "Buku ini sangat menjijikan"

class DataUlasan {
  DataUlasan({
      this.ulasanID, 
      this.username, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.rating, 
      this.ulasan,});

  DataUlasan.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    username = json['Username'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    rating = json['rating'];
    ulasan = json['ulasan'];
  }
  int? ulasanID;
  String? username;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  int? rating;
  String? ulasan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['Username'] = username;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['rating'] = rating;
    map['ulasan'] = ulasan;
    return map;
  }

}