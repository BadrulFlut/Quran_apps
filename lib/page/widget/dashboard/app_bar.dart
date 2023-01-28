import 'package:app_alquran/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icon/menu-icon.svg',
                    height: 24,
                    width: 24,
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Qur\'aini',
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
