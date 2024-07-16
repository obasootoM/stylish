import 'package:flutter/material.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/onboarding_screen/screen/onboarding_screen.dart';
import 'package:stylish/features/search_screen/screen/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> itemList = [
    const OnboardingScreens(),
    Center(child: const Text('cart')),
     const SearchScreen(),
    Center(child: const Text('setting')),
  ];
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 233, 12, 12),
        selectedIconTheme: const IconThemeData(
          fill: 1.0,
          color:  Color.fromARGB(255, 233, 12, 12)
        ),
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: changePage,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(ConstImage.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(ConstImage.heart), label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Image.asset(ConstImage.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Image.asset(ConstImage.setting), label: 'Setting'),
          ]),
      body: itemList[currentIndex],
    );
  }
}
