// To parse this JSON data, do
//
//     final surahGetId = surahGetIdFromJson(jsonString);

import 'dart:convert';

SurahGetId surahGetIdFromJson(String str) =>
    SurahGetId.fromJson(json.decode(str));

String surahGetIdToJson(SurahGetId data) => json.encode(data.toJson());

class SurahGetId {
  SurahGetId({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    required this.status,
    required this.ayat,
  });

  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;
  bool status;
  List<Ayat> ayat;

  factory SurahGetId.fromJson(Map<String, dynamic> json) => SurahGetId(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        status: json["status"],
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "status": status,
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
      };
}

class Ayat {
  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  int id;
  int surah;
  int nomor;
  String ar;
  String tr;
  String idn;

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}
