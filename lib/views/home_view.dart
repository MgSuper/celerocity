import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Search Celebrity',
                    style: ThemeSelector.selectBodyText(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: screenHeight * 0.03,
                          child: Image.asset(
                            'assets/icons/search.png',
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search ...',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'AD Here',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index == 0
                            ? SizedBox()
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                        Text(
                          'FEB 17 2022',
                        ),
                        Text(
                          'Ra Mi-Ran & Uhm Ji-Won cast in TVING drama "Cruel Intern"',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Image.asset(
                          'assets/project2.jpg',
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: Text(
                            'Ra Mi-Ran & Uhm Ji-Won are cast in TVING drama series “Cruel Intern.” The actresses previously worked together in 2013 movie “Hope.” In movie “Cruel Intern,” Ra Mi-Ran will play Go Hae-Ra. She left her working career to be a full-time mom for the past 7 years, but now wants work again. She gets hired for an intern position at a company where her former colleague Choi Ji-Won (Uhm Ji-Won) now wields power.',
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        index == 4
                            ? SizedBox()
                            : Divider(
                                height: 3,
                                thickness: 3,
                                color: Colors.white,
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        profilePicture(),
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subHeader('Computer Scientist - App Developer - Flutter Enthusiast', 15)
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
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
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
