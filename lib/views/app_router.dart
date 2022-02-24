import 'package:flutter/material.dart';
import 'package:portfolio_website/homepage.dart';
import 'package:portfolio_website/views/detail.dart';
import 'package:portfolio_website/views/page_not_found.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;
      case '/detail':
        return MaterialPageRoute(
          builder: (_) => Detail(
            passedData: routeSettings.arguments,
          ),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => PageNotFound(),
        );
    }
  }
}
