import 'package:app_alquran/colors.dart';
import 'package:app_alquran/models/surah_get_id.dart';
import 'package:app_alquran/service/service_surah.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDetailPage extends StatefulWidget {
  final int surah;
  const ListDetailPage({super.key, required this.surah});

  @override
  State<ListDetailPage> createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  ServiceSurah _serviceSurah = ServiceSurah();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
        width: double.infinity,
        child: FutureBuilder<SurahGetId>(
          future: _serviceSurah.getDetailSurah(widget.surah),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SurahGetId? data = snapshot.data;
              return ListView.builder(
                itemCount: data!.ayat.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final surah = data.ayat[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 45,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(22, 44, 44, 44),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 27,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  surah.nomor.toString(),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      size: 24.0,
                                      color: primary,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_border,
                                      color: primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          alignment: Alignment.centerRight,
                          width: double.infinity,
                          child: Text(
                            surah.ar,
                            style: GoogleFonts.amiri(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            surah.idn,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Container(
                            height: 0.2,
                            width: 326,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              Center(
                child: Text('${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            );
          },
        ));
  }
}
