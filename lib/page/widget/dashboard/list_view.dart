import 'package:app_alquran/colors.dart';
import 'package:app_alquran/lastread.dart';
import 'package:app_alquran/models/surah.dart';
import 'package:app_alquran/page/detail_screen.dart';
import 'package:app_alquran/page/widget/dashboard/last_read.dart';
import 'package:app_alquran/service/service_surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final ServiceSurah _serviceSurah = ServiceSurah();
  List<Surah> _listSurah = [];

  @override
  void initState() {
    _fectData();
    super.initState();
  }

  _fectData() async {
    var listSurahs = await _serviceSurah.getSurahs();
    setState(() {
      _listSurah = listSurahs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        child: _listSurah.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: primary),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _listSurah.length,
                itemBuilder: (context, index) {
                  final surah = _listSurah[index];
                  return InkWell(
                    onTap: () {
                      LastRead()
                          .updateLastRead(surah.namaLatin, surah.jumlahAyat);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                    id: surah.nomor,
                                    surah: surah,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icon/nomor-surah.svg',
                                    height: 36,
                                    width: 36,
                                    color: primary,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(surah.nomor.toString(),
                                      style: GoogleFonts.poppins(
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            title: Text(
                              surah.namaLatin,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              '${surah.jumlahAyat} AYAT',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  color: text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: Text(surah.nama,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 18, right: 18),
                            width: double.infinity,
                            height: 0.4,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
