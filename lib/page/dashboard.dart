import 'package:app_alquran/colors.dart';
import 'package:app_alquran/page/widget/dashboard/app_bar.dart';
import 'package:app_alquran/page/widget/dashboard/last_read.dart';
import 'package:app_alquran/page/widget/dashboard/list_view.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          children: const [
            AppBarPage(),
            LastReadPage(),
            Expanded(child: ListViewPage()),
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
