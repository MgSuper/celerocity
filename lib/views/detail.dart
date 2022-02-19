import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/widgets/bottom_bar.dart';
import 'package:portfolio_website/widgets/custom_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  Detail({this.passedData});
  final passedData;
  double screenWidth;
  double screenHeight;

  void openURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
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
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.3,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(passedData['image']),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  String infoLabel;
  String infoText;
  ProfileRow({
    this.infoLabel,
    this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 10.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(infoLabel),
          Text(infoText),
        ],
      ),
    );
  }
}
