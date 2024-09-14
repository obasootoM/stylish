import 'package:flutter/material.dart';
import 'package:stylish/features/onboarding_screen/screen/onboarding_screen.dart';
import 'package:stylish/features/search_screen/screen/search_screen.dart';
import 'package:stylish/features/wishList/screen/wish_list.dart';

class BottomNavBar extends StatefulWidget {
  
  const BottomNavBar({super.key,});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 
  int currentIndex = 0;
  List<Widget> itemList = [
    const OnboardingScreens(),
    const SearchScreen(
      search: '',
    ),
    const WishListScreen(),
    const Center(child: Text('setting')),
  ];
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  // List<Widget> navIcons = [
  //   Image.asset(ConstImage.home,),
  //   Image.asset(ConstImage.heart),
  //   Image.asset(ConstImage.shoppingCart),
  //   Image.asset(ConstImage.search),
  //   Image.asset(ConstImage.setting),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottonNavBar(Icons.home, 'home', 0),
              _bottonNavBar(Icons.favorite, 'wishlist', 1),
              _bottonNavBar(Icons.search, 'search', 2),
              _bottonNavBar(Icons.settings, 'setting', 3),
            ],
          )),

      // ClipOval(
      //     child: Material(
      //       color: Colors.grey[200],
      //         elevation: 10,
      //         child: InkWell(
      //           child: SizedBox(
      //             width: 56,
      //             height: 56,
      //             child: Icon(
      //               Icons.shopping_cart,
      //               size: 20,
      //               color: Colors.black,
      //             ),
      //           ),
      //         )),
      //   ),
      // bottomNavigationBar: BottomNavigationBar(
      //  type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.grey[200],
      //     selectedItemColor: const Color.fromARGB(255, 233, 12, 12),
      //     selectedIconTheme: const IconThemeData(
      //         fill: 1.0, color: Color.fromARGB(255, 233, 12, 12)),
      //   currentIndex: currentIndex,
      //     // letIndexChange: ,
      //     onTap: changePage,
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite), label: 'Wishlist'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search), label: 'Search'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.settings), label: 'Setting'),
      //     ]
      //     ),
      body: itemList[currentIndex],
    );
  }

  Widget _bottonNavBar(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => changePage(index),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icon,
          color: currentIndex == index
              ? const Color.fromARGB(255, 240, 28, 13)
              : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
              color: currentIndex == index
                  ? const Color.fromARGB(255, 240, 28, 13)
                  : Colors.black,
              fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
