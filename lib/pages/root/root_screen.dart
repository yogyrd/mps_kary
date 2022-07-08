import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_kary_corenitymps_kbm/constants/colors.dart';
import 'package:mobile_kary_corenitymps_kbm/pages/home/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late int currentIndex;

  final _pageOption = [
    const HomeView(),
    const HomeView(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pageOption[currentIndex],
        bottomNavigationBar: BubbleBottomBar(
          hasNotch: true,
          opacity: 0.2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          tilesPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          items: const <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: AppColors.firebrik,
              icon: Icon(
                Icons.home_filled,
                color: AppColors.prurussianBlue,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: AppColors.firebrik,
              ),
              title: Text("Home")
            ),
            BubbleBottomBarItem(
              backgroundColor: AppColors.firebrik,
              icon: Icon(
                Icons.person_rounded,
                color: AppColors.prurussianBlue,
              ),
              activeIcon: Icon(
                Icons.person_rounded,
                color: AppColors.firebrik,
              ),
              title: Text("Profile")
            ),
          ],
        ),
      )
    );
  }
}