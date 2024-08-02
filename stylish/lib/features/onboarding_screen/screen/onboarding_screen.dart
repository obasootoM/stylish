import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';
import 'package:stylish/features/onboarding_screen/widget/arrow_button.dart';
import 'package:stylish/features/onboarding_screen/widget/banner.dart';
import 'package:stylish/features/onboarding_screen/widget/onboard_search_screen.dart';
import 'package:stylish/features/onboarding_screen/widget/product_list.dart';
import 'package:stylish/features/onboarding_screen/widget/search_bar.dart';
import 'package:stylish/features/onboarding_screen/widget/special_offer.dart';
import 'package:stylish/features/onboarding_screen/widget/sub_product_list.dart';
import '../widget/deal_of_d_day.dart';
import '../widget/list_category.dart';
import '../widget/small_container.dart';

class OnboardingScreens extends StatefulWidget {
  static const routeName = '/onboarding-screens';
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController(initialPage: 0);
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  var currentTime;
  @override
  void initState() {
    currentTime = DateFormat('d/MM/yyyy').format(DateTime.now());
    _searchController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, OboardingSearch.routeName, arguments: query);
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
              controller: _searchController,
              focusNode: _focusNode,
              onChanged: (value) {
                setState(() {});
              },
              onsubmitted: navigateToSearchScreen,
            ),
            // TextFormField(
            //             onFieldSubmitted: navigateToSearchScreen,
            //             decoration: const InputDecoration(
            //                 prefixIcon: InkWell(
            //                   child: Padding(
            //                     padding: EdgeInsets.only(left: 6),
            //                     child: Icon(
            //                       Icons.search,
            //                       color: Colors.black,
            //                       size: 23,
            //                     ),
            //                   ),
            //                 ),
            //                 fillColor: Colors.white,
            //                 filled: true,
            //                 contentPadding: EdgeInsets.only(top: 10),
            //                 border: OutlineInputBorder(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(7)),
            //                     borderSide:
            //                         BorderSide(color: Colors.black, width: 1)),
            //                 enabledBorder: OutlineInputBorder(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(7)),
            //                     borderSide: BorderSide.none),
            //                 hintText: 'Search Amazon.in',
            //                 hintStyle: TextStyle(
            //                     fontWeight: FontWeight.w500, fontSize: 17)),
            //           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isMobile(context))
                  const CommonText(
                      margin: EdgeInsets.only(left: 20),
                      text: 'All Featured',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      size: 20),
                Row(
                  children: [
                    if (isMobile(context))
                      const SmallContainer(
                        text: 'sort',
                        image: ConstImage.component,
                      ),
                    const SmallContainer(
                        text: 'Filter', image: ConstImage.vector)
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
              dealText: 'Deal of the Day',
              icon: Icons.timer,
              backgroundColor: const Color.fromARGB(255, 44, 142, 223),
            ),
            const SizedBox(
              height: 10,
            ),
            const ProductContainer(
              physics: NeverScrollableScrollPhysics(),
            ),
            const SpecialOffer(),
            DealOfTheDay(
              text: 'last Date $currentTime',
              dealText: 'Trending Products',
              backgroundColor: Colors.pinkAccent,
              icon: Icons.calendar_month,
            ),
            const SizedBox(
              height: 5,
            ),
            const SubProductList(),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 18, top: 10, right: 18),
              width: width * 1,
              height: height * 0.4,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width * 1,
                    height: height * 0.3,
                    child: Image.asset(
                      ConstImage.maskGroup3,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const CommonText(
                      text: 'New Arrivals',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      size: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                          text: 'Summer\' 25 Collections',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          size: 20),
                      const ArrowButton(
                          text: 'View all',
                          textColor: Colors.white,
                          backgroundcolors: Color.fromARGB(255, 230, 19, 4),
                          margin: EdgeInsets.only(right: 10))
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 18, top: 10, right: 18, bottom: 10),
              width: width * 1,
              height: height * 0.4,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                      text: 'Sponserd',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      size: 20),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 1,
                    height: height * 0.3,
                    child: Image.asset(
                      ConstImage.maskGroup4,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
