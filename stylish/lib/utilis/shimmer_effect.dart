import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      loop: 1,
      baseColor: Colors.white,
      highlightColor: Colors.white,
      child: ListView.separated(
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
                    Row(children: [
                      Container(
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                      ),
                    ),
                    Container(
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                      ),
                    ),
                    ],)
                  ],))
              ],),
            );
          },
          separatorBuilder: (_,ind) => const  SizedBox(height: 16,),
          itemCount: 10),
    );
  }
}
