import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Refresh extends StatefulWidget {
  const Refresh({super.key});

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  Future<void> liquidRefresh() async {
    return await Future.delayed(const Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: LiquidPullToRefresh(
          backgroundColor: Colors.white,
          animSpeedFactor: 2.0,
          color: Colors.yellow,
          child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width *1,
              height: height * 0.3,
              color: Colors.red,
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width *1,
              height: height * 0.3,
              color: Colors.blue,
            ),
          ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width *1,
              height: height * 0.3,
              color: Colors.green,
            ),
          )
        ]), onRefresh: liquidRefresh),
      ),
    );
  }
}