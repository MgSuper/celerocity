import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/home_item.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({@required this.controller, @required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.21
        : screenWidth > 1100
            ? 0.3
            : 0.4;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: screenWidth * tabBarScaling,
            child: Theme(
              data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                controller: controller,
                indicatorColor: Color(0xff21a179),
                tabs: tabs,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
