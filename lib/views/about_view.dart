import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/bullet_list.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  double screenWidth;
  double screenHeight;
  String visiter =
      'Visitors can browse to find the data of famous Asian, Hollywood and Bollywood stars around the globe.';
  String hope =
      'Hope visitors enjoy spending their spare time by wondering the information of celebrities.';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: BulletList(
                  strings: [visiter, hope],
                )),
            Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        Container(
          height: screenHeight * 0.3,
          child: BulletList(
            strings: [visiter, hope],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        children: [
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Container(
          color: Colors.grey,
          child: Center(
            child: Image.asset('assets/logo.jpeg'),
          ),
        ),
      ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Text(
      'Celerocity describes all about celebrities information. We provides the information of celebrities’ profiles, their awards, their dramas and movies.',
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
