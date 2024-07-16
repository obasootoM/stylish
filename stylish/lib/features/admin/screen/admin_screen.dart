import 'package:flutter/material.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/admin/widget/home_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Widget> page = [
    const HomeScreen(),
    const Center(
      child: Text('Analytics'),
    ),
    const Center(
      child: Text('Note'),
    )
  ];
  int currentIndex = 0;
  void selectPage(int page) {
    setState(() {
      currentIndex = page;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: selectPage,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  ConstImage.home,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: 'Analytics'),
            const BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Note')
          ]),
      body: page[currentIndex],
    );
  }
}
