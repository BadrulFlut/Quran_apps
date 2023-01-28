import 'package:app_alquran/colors.dart';
import 'package:app_alquran/models/surah.dart';
import 'package:app_alquran/page/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarPage extends StatefulWidget {
  final Surah surah;
  const AppBarPage({super.key, required this.surah});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const Dashboard()),
                        (route) => false);
                  },
                  icon: SvgPicture.asset(
                    'assets/icon/back-icon.svg',
                    height: 24,
                    width: 24,
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.surah.namaLatin,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold, color: primary),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icon/search-icon.svg',
                height: 24,
                width: 24,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
