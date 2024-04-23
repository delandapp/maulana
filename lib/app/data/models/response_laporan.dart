/// Status : 200
/// Message : "Berhasil Menampilkan Peminjaman"
/// data : {"PeminjamanID":9,"kode_peminjaman":"2024ZLN162","status":"Dipinjam","username":"ryan fahrezi","email":"ryanfahrezi@smk.belajar.id","tanggal_pinjam":"2024-04-16","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-23","judul_buku":"Modern AI","penulis_buku":"Yogha Irgi","penerbit_buku":"Athila davin","tahun_buku":"2009"}

class ResponseLaporan {
  ResponseLaporan({
      this.status, 
      this.message, 
      this.data,});

  ResponseLaporan.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataLaporan.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataLaporan? data;

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

/// PeminjamanID : 9
/// kode_peminjaman : "2024ZLN162"
/// status : "Dipinjam"
/// username : "ryan fahrezi"
/// email : "ryanfahrezi@smk.belajar.id"
/// tanggal_pinjam : "2024-04-16"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-04-23"
/// judul_buku : "Modern AI"
/// penulis_buku : "Yogha Irgi"
/// penerbit_buku : "Athila davin"
/// tahun_buku : "2009"

class DataLaporan {
  DataLaporan({
      this.peminjamanID, 
      this.kodePeminjaman, 
      this.status, 
      this.username, 
      this.email, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.deadline, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunBuku,});

  DataLaporan.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    kodePeminjaman = json['kode_peminjaman'];
    status = json['status'];
    username = json['username'];
    email = json['email'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    deadline = json['Deadline'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunBuku = json['tahun_buku'];
  }
  int? peminjamanID;
  String? kodePeminjaman;
  String? status;
  String? username;
  String? email;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? deadline;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['kode_peminjaman'] = kodePeminjaman;
    map['status'] = status;
    map['username'] = username;
    map['email'] = email;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['Deadline'] = deadline;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_buku'] = tahunBuku;
    return map;
  }

}