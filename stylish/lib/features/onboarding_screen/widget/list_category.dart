import 'package:flutter/material.dart';
import 'package:stylish/features/category_screen/screen/category_screen.dart';
import '../../../ model/onboarding_model.dart';
import '../../../common/common_text.dart';

class Listcategory extends StatefulWidget {
  const Listcategory({
    super.key,
  });

  @override
  State<Listcategory> createState() => _ListcategoryState();
}

class _ListcategoryState extends State<Listcategory> {
  void navigateToCategoryScreen(BuildContext context, String category) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryScreen(category: category)));
  }

  bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      width: width * 0.9,
      height: height * 0.15,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      child: ListView.builder(
        controller: PageController(),
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  navigateToCategoryScreen(context, imageList[index]['text']);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: width * 0.15,
                  height: height * 0.07,
                  decoration: const ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  child: Image.asset(
                    imageList[index]['image'],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CommonText(
                  text: imageList[index]['text'],
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  size: 12)
            ],
          );
        },
      ),
    );
  }
}
