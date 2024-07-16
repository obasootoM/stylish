import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/onboarding_screen/widget/banner.dart';
import 'package:stylish/features/onboarding_screen/widget/product_list.dart';
import 'package:stylish/features/onboarding_screen/widget/search.dart';
import 'package:stylish/features/onboarding_screen/widget/search_bar.dart';
import '../widget/deal_of_d_day.dart';
import '../widget/list_category.dart';
import '../widget/small_container.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController(initialPage: 0);
  final FocusNode _focusNode = FocusNode();
  var currentTime;
  @override
  void initState() {
    currentTime = DateTime.now();
    super.initState();
  }

  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Image.asset(ConstImage.group336),
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            ConstImage.group34010,
            width: width * 0.15,
            height: height * 0.05,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            ConstImage.styliah2,
            width: width * 0.15,
            height: height * 0.05,
          ),
        ]),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar())
        ],
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SearchBars(
              focusNode: _focusNode,
              onTap: () {
                showSearch(context: context, delegate: Search());
              },
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    margin: EdgeInsets.only(left: 20),
                    text: 'All Featured',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    size: 20),
                Row(
                  children: [
                    SmallContainer(
                      text: 'sort',
                      image: ConstImage.component,
                    ),
                    SmallContainer(text: 'Filter', image: ConstImage.vector)
                  ],
                )
              ],
            ),
            const Listcategory(),
            Banners(
              controller: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    spacing: 5,
                    activeDotColor: Color.fromARGB(255, 240, 165, 165),
                    dotColor: Colors.grey,
                  ),
                ),
              ],
            ),
            DealOfTheDay(
              text: '$currentTime',
            ),
            SizedBox(
              height: 10,
            ),
            const ProductContainer(physics: NeverScrollableScrollPhysics(),)
          ]),
        ),
      ),
    );
  }
}
