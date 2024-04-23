/// Status : 200
/// Message : "Berhasil Menampilkan Buku"
/// data : {"BukuID":1,"Deskripsi":"Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata","CoverBuku":"http://192.168.1.8:8000/storage/images/coverbook/AI Masa Depan.jpeg","judul_buku":"AI Masa Depan","penulis_buku":"Deland Arjuna","penerbit_buku":"Athila davin","tahun_terbit":"2009","jumlah_halaman":"214","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":0,"Koleksi":null}

class ResponseDetailsbook {
  ResponseDetailsbook({
      this.status, 
      this.message, 
      this.data,});

  ResponseDetailsbook.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataBookDetails.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataBookDetails? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// BukuID : 1
/// Deskripsi : "Buku ini memberikan pengantar menyeluruh tentang kecerdasan buatan (AI), mulai dari sejarah dan perkembangannya hingga berbagai aplikasinya di dunia nyata"
/// CoverBuku : "http://192.168.1.8:8000/storage/images/coverbook/AI Masa Depan.jpeg"
/// judul_buku : "AI Masa Depan"
/// penulis_buku : "Deland Arjuna"
/// penerbit_buku : "Athila davin"
/// tahun_terbit : "2009"
/// jumlah_halaman : "214"
/// Rating : 5
/// Total_ulasan : 1
/// JumlahRating : 5
/// JumlahPeminjam : 0
/// Koleksi : null

class DataBookDetails {
  DataBookDetails({
      this.bukuID, 
      this.deskripsi, 
      this.coverBuku, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.koleksi,});

  DataBookDetails.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
    coverBuku = json['CoverBuku'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunTerbit = json['tahun_terbit'];
    jumlahHalaman = json['jumlah_halaman'];
    rating = json['Rating'].toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    koleksi = json['Koleksi'];
  }
  int? bukuID;
  String? deskripsi;
  String? coverBuku;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;
  dynamic koleksi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
    map['CoverBuku'] = coverBuku;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_terbit'] = tahunTerbit;
    map['jumlah_halaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    map['Koleksi'] = koleksi;
    return map;
  }

}