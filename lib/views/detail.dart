import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/widgets/profile_role.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final passedData;
  Detail({this.passedData});
  double screenWidth;
  double screenHeight;

  void openURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(
        desktopView: desktopView(context), mobileView: mobileView(context));
  }

  Widget desktopView(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      appBar: AppBar(
        backgroundColor: Color(0xff1e1e24),
        elevation: 0,
        title: Text('Celerocity'),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.instagram),
            onPressed: () => openURL('https://www.instagram.com/paing_takhon'),
            iconSize: screenHeight * 0.03,
            color: Color(0xFF833AB4),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.facebook),
            onPressed: () => openURL('https://www.facebook.com/ptk.offical'),
            iconSize: screenHeight * 0.03,
            color: Colors.blue,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
      body: Row(
        children: [
          // Expanded(
          //   child: adSenseAdsView(),
          // ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      passedData['name'],
                      style: ThemeSelector.selectHeadline(context),
                    ),
                    Container(
                      height: screenHeight * 0.6,
                      width: screenWidth * 0.4,
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: passedData['image'],
                        fit: BoxFit.cover,
                        width: 500,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    ProfileRow(
                      infoLabel: 'Name : ',
                      infoText: passedData['name'],
                    ),
                    ProfileRow(
                      infoLabel: 'Birthdate : ',
                      infoText: passedData['birthdate'],
                    ),
                    ProfileRow(
                      infoLabel: 'Birthplace : ',
                      infoText: passedData['birthplace'],
                    ),
                    ProfileRow(
                      infoLabel: 'Blood Type : ',
                      infoText: passedData['blood-type'],
                    ),
                    ProfileRow(
                      infoLabel: 'Height : ',
                      infoText: passedData['height'],
                    ),
                    ProfileRow(
                      infoLabel: 'Weight : ',
                      infoText: passedData['weight'],
                    ),
                    ProfileRow(
                      infoLabel: 'Facebook : ',
                      infoText: passedData['facebook'],
                    ),
                    ProfileRow(
                      infoLabel: 'Instagram : ',
                      infoText: passedData['instagram'],
                    ),
                    ProfileRow(
                      infoLabel: 'Twitter : ',
                      infoText: passedData['twitter'],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      'Biography',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      passedData['biography'],
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Awards',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      passedData['awards'],
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Drama Series',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      passedData['drama-series'],
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mobileView(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      appBar: AppBar(
        backgroundColor: Color(0xff1e1e24),
        elevation: 0,
        title: Text('Celerocity'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.jpeg'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.instagram),
            onPressed: () => openURL('https://www.instagram.com/paing_takhon'),
            iconSize: screenHeight * 0.03,
            color: Color(0xFF833AB4),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.facebook),
            onPressed: () => openURL('https://www.facebook.com/ptk.offical'),
            iconSize: screenHeight * 0.03,
            color: Colors.blue,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
      body: Column(
        children: [
          // adSenseAdsView(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      passedData['name'],
                      style: ThemeSelector.selectHeadline(context),
                    ),
                    Container(
                      height: screenHeight * 0.6,
                      width: screenWidth * 0.4,
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: passedData['image'],
                        fit: BoxFit.cover,
                        width: 500,
                      ),
                    ),
                    Text(
                      'Profile',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    ProfileRow(
                      infoLabel: 'Name : ',
                      infoText: passedData['name'],
                    ),
                    ProfileRow(
                      infoLabel: 'Birthdate : ',
                      infoText: passedData['birthdate'],
                    ),
                    ProfileRow(
                      infoLabel: 'Birthplace : ',
                      infoText: passedData['birthplace'],
                    ),
                    ProfileRow(
                      infoLabel: 'Blood Type : ',
                      infoText: passedData['blood-type'],
                    ),
                    ProfileRow(
                      infoLabel: 'Height : ',
                      infoText: passedData['height'],
                    ),
                    ProfileRow(
                      infoLabel: 'Weight : ',
                      infoText: passedData['weight'],
                    ),
                    ProfileRow(
                      infoLabel: 'Facebook : ',
                      infoText: passedData['facebook'],
                    ),
                    ProfileRow(
                      infoLabel: 'Instagram : ',
                      infoText: passedData['instagram'],
                    ),
                    ProfileRow(
                      infoLabel: 'Twitter : ',
                      infoText: passedData['twitter'],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      'Biography',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      passedData['biography'],
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Awards',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      passedData['awards'],
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Drama Series',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      passedData['drama-series'],
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
