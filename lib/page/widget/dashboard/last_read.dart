import 'package:app_alquran/colors.dart';
import 'package:app_alquran/lastread.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LastReadPage extends StatefulWidget {
  const LastReadPage({super.key});

  @override
  State<LastReadPage> createState() => _LastReadPageState();
}

class _LastReadPageState extends State<LastReadPage> {
  final lastRead = LastRead();

  @override
  void initState() {
    lastRead;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(LastRead().namaLastRead);
    print(LastRead().ayatLastRead);
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 25, right: 15, left: 15, bottom: 20),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Assalamualaikum',
            style: GoogleFonts.poppins(
                color: text, fontSize: 18, fontWeight: FontWeight.w500)),
        Text('Badrul',
            style: GoogleFonts.poppins(
                color: gray, fontSize: 24, fontWeight: FontWeight.w600)),
        Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 135,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    colors: [const Color.fromARGB(255, 202, 149, 255), primary],
                    begin: Alignment.topLeft)),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/icon/quran.svg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 17, bottom: 17),
                  width: 190,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icon/book.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Last Read',
                            style: GoogleFonts.poppins(color: Colors.white),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lastRead.namaLastRead ?? 'Kamu Belum Membaca',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            'Ayat : ${lastRead.ayatLastRead ?? '0'}',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ))
      ]),
    );
  }
}
