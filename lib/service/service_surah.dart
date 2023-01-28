import 'dart:convert';

import 'package:app_alquran/models/surah.dart';
import 'package:app_alquran/models/surah_get_id.dart';
import 'package:dio/dio.dart';

class ServiceSurah {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://equran.id/api/surat';

  Future<List<Surah>> getSurahs() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        List<Surah> surahs = [];
        jsonData.forEach((element) {
          Surah surah = Surah.fromJson(element);
          surahs.add(surah);
        });
        return surahs;
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      print(e);
      throw Exception('Error server');
    }
  }

  // Future<List<SurahGetId>> getDetailSurah(int id) async {
  //   try {
  //     final response = await _dio.get("${_baseUrl}/${id}");
  //     if (response.statusCode == 200) {
  //       final List<dynamic> jsonData = response.data;
  //       List<SurahGetId> surahs = [];
  //       jsonData.forEach((element) {
  //         SurahGetId surahGetId = SurahGetId.fromJson(element);
  //         surahs.add(surahGetId);
  //       });
  //       return surahs;
  //     } else {
  //       throw Exception('Gagal mengambil data');
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw Exception('Error server');
  //   }
  // }
  Future<SurahGetId> getDetailSurah(int id) async {
    var response = await Dio().get(
      "${_baseUrl}/${id}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return SurahGetId.fromJson(response.data);
  }
}
