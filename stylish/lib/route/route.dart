import 'package:flutter/material.dart';
import 'package:stylish/%20model/product.dart';
import 'package:stylish/features/category_screen/screen/category_screen.dart';
import 'package:stylish/features/onboarding_screen/screen/onboarding_screen.dart';
import 'package:stylish/features/onboarding_screen/widget/onboard_search_screen.dart';
import 'package:stylish/features/pageview_screen/screen/pageview_screen.dart';
import 'package:stylish/features/puchase_detailed_screen/screen/purchase_detailed_screen.dart';
import 'package:stylish/features/search_screen/screen/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingScreens.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const OnboardingScreens());
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const OnboardingScreens());
    case SearchScreen.routeName:
      var search = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                search: search,
              ));
    case CategoryScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryScreen(
                category: category,
              ));
    case OboardingSearch.routeName:
      var search = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OboardingSearch(
                search: search,
              ));
    case PurchaseDetailedScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  PurchaseDetailedScreen(product: product,));
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(child: Text('screen does not exist yet!')),
              ));
  }
}
