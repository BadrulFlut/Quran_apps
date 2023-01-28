import 'package:app_alquran/colors.dart';
import 'package:app_alquran/models/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerPage extends StatelessWidget {
  final Surah surah;
  const BannerPage({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: 327,
              height: 265,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                        spreadRadius: 1)
                  ],
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 202, 149, 255),
                    primary
                  ], begin: Alignment.topLeft)),
              child: Container(
                child: Opacity(
                  opacity: 0.1,
                  child: SvgPicture.asset(
                    'assets/icon/quran.svg',
                    height: 150,
                    width: 280,
                  ),
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                surah.namaLatin,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                surah.arti,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  height: 0.2,
                  width: 200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${surah.jumlahAyat} AYAT',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              SvgPicture.asset(
                'assets/icon/bismillah.svg',
                height: 48,
                width: 214,
              )
            ],
          )
        ],
      ),
    );
  }
}
