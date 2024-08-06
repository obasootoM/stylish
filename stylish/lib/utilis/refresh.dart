import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

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
      body: LiquidPullToRefresh(
          backgroundColor: Colors.white,
          animSpeedFactor: 2.0,
          color: Colors.yellow,
          child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return SizedBox(
                height: 96,
                child: Row(children: [
                  Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                        ),
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Expanded(
                          child: Container(
                            margin:const  EdgeInsets.only(right: 5),
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                          ),
                                              ),
                        ),
                      Expanded(
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                          ),
                        ),
                      ),
                      ],)
                    ],))
                ],),
              );
            },
            separatorBuilder: (_,ind) => const  Divider(),
            itemCount: 10),
      ), onRefresh: liquidRefresh),
    );
  }
}