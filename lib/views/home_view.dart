import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/adview.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/build_mobile_item.dart';
import 'package:portfolio_website/widgets/build_web_item.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';

import '../utils/firestore_database.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double screenWidth;
  double screenHeight;
  List dataList = [];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: FireStoreDataBase().getData(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasError) {
                        return const Text(
                          "Something went wrong",
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        dataList = snapshot.data as List;
                        return BuildWebItem(dataList: dataList);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: NavigationArrow(isBackArrow: false),
            )
          ],
        ),
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FutureBuilder(
            future: FireStoreDataBase().getData(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasError) {
                return const Text(
                  "Something went wrong",
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                dataList = snapshot.data as List;
                return BuildMobileItem(dataList: dataList);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 400;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 350;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Image.asset(
          'assets/picture.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
        style: ThemeSelector.selectHeadline(context),
        children: <TextSpan>[
          TextSpan(text: 'Hi, my name is '),
          TextSpan(text: 'Florian', style: TextStyle(color: Color(0xff21a179))),
          TextSpan(text: '!'),
        ],
      ),
    );
  }

  Widget subHeader(String text, double fontSize) {
    return Text(text, style: ThemeSelector.selectSubHeadline(context));
  }
}
