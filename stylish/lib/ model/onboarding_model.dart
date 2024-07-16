import 'package:stylish/const/const.dart';

class OnboardingModel {
  final String text;
  final String image;
  final String subText;

  OnboardingModel(
      {required this.text, required this.image, required this.subText});
}

List<OnboardingModel> screen = [
  OnboardingModel(
      text: ConstImage.chooseProduct,
      image: ConstImage.fashion2,
      subText:
          'Amet minim mollit non deserunt ullamco est\n sit aliqua dolor do amet sint. Velit officia\n      consequat duis enim velit mollit.'),
  OnboardingModel(
      text: ConstImage.getUrProduct,
      image: ConstImage.sales,
      subText:
          'Amet minim mollit non deserunt ullamco est\n   sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.'),
  OnboardingModel(
      text: ConstImage.makePayment,
      image: ConstImage.shopping,
      subText:
          'Amet minim mollit non deserunt ullamco est\n  sit aliqua dolor do amet sint. Velit officia\n consequat duis enim velit mollit.'),
];

List<Map<String, dynamic>> imageList = [
  {'image': ConstImage.ellipse, 'text': 'Beauty'},
  {'image': ConstImage.Q3, 'text': 'Fashion'},
  {'image': ConstImage.Gc, 'text': 'Kids'},
  {'image': ConstImage.oye, 'text': 'Mens'},
  {'image': ConstImage.xy, 'text': 'Womens'},
];

List<Map<String, dynamic>> bannerList = [

  {
    "title" :"50-40% OFF",
    "subtitle":"Now in (product)\nAll colours",
  },
   {
    "title" :"it\'s Black Friday",
    "subtitle":"Get your product today\n@70% OFF"
  },
  {
    "title": "Sunday Jingo",
    "subtitle": "Products are Rolling Out Tod@y"
  }
];
