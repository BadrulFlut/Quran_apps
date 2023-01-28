import 'package:app_alquran/colors.dart';
import 'package:app_alquran/models/surah.dart';
import 'package:app_alquran/page/widget/detail/app_bar.dart';
import 'package:app_alquran/page/widget/detail/banner.dart';
import 'package:app_alquran/page/widget/detail/list_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Surah surah;
  final int id;
  const DetailScreen({super.key, required this.id, required this.surah});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        reverse: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarPage(
              surah: widget.surah,
            ),
            BannerPage(
              surah: widget.surah,
            ),
            Expanded(
              child: ListDetailPage(
                surah: widget.id,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          scrollController.animateTo(1,
              duration: const Duration(seconds: 2), curve: Curves.easeInOut);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 202, 149, 255), primary],
                  begin: Alignment.topLeft),
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.keyboard_double_arrow_up_outlined,
            color: Colors.white,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
