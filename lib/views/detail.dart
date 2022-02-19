import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/utils/theme_selector.dart';
import 'package:portfolio_website/widgets/bottom_bar.dart';
import 'package:portfolio_website/widgets/custom_tab_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  Detail({Key key}) : super(key: key);

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
                      'Paing Takhon',
                      style: ThemeSelector.selectHeadline(context),
                    ),
                    Text(
                      'Profile',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    ProfileRow(
                      infoLabel: 'Name : ',
                      infoText: 'Paing Takhon',
                    ),
                    ProfileRow(
                      infoLabel: 'Full Name : ',
                      infoText: 'Sit Ko Paing',
                    ),
                    ProfileRow(
                      infoLabel: 'Birthdate : ',
                      infoText: '17.7.1996',
                    ),
                    ProfileRow(
                      infoLabel: 'Blood Type : ',
                      infoText: '-',
                    ),
                    ProfileRow(
                      infoLabel: 'Height : ',
                      infoText: '180 cm',
                    ),
                    ProfileRow(
                      infoLabel: 'Native : ',
                      infoText: 'Myanmar',
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      'Summary',
                      style: ThemeSelector.selectSubHeadline(context),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Paing Takhon was born on 17 July 1996 in Kawthaung, Tanintharyi Region, Myanmar to parent Tun Moe and his wife Khin Kyu. But he grew up in Khamaukgyi. He is the fourth son of six siblings, having an elder brother, two elder sisters and two younger brothers. He graduated high school from Basic Education High School No. 1 Khamaukgyi. In 2014, Paing moved to Yangon to become a model. He is currently studying at University of Distance Education, Yangon, majoring in Psychology. Paing joined John Lwin\'s model training in 2014. Since then, he took professional training in modelling and catwalk. He began his entertainment career as a runway model as part of the John Lwin\'s John International Modeling Agency with countless advertising shows and runways that had been walked on. Then came the offers for TV commercials and then DVD ones. He has appeared in many music videos and as fashion model on magazine cover photos. His hardwork as a model and acting in commercials was noticed by the film industry and soon, movie casting offers came rolling in. In 2016, Paing attended to Indonesia to take part in "Asean Celebrity Explore Quest Malaysia 2016" (ACEQM) together with Nan Su Yati Soe as a representative from Myanmar which is held with famous celebrities and models from South East Asia countries. Paing and Nan Su performed together with U Shwe Yoe and Daw Moe dance at the event. Paing is also a singer and started singing in 2017. He began endeavoring to be able to produce and distribute his first solo album. He launched his debut solo album "Chit Thu" (Lover) on 16 September 2017. Paing donated all his money from selling his albums to orphan children from Ananda Metta orphan school. In 2018, Paing featured on the BuzzFeed "23 Stunning South Asian Men That Are Too Gorgeous For Words". In 2019, Paing also ranked second on The Myanmar Times "Top 10 Actors". Paing is also popular in Thailand. On 3 August 2019, he held a grand fan meeting in Bangkok, Thailand, where a huge crowd of many fans gathered. Paing is an ASEAN Economic Community ambassador. On 21 September 2019, he was appointed as Myanmar\'s tourism ambassador to Thailand by the Myanmar Tourism Marketing Association together with the Myanmar Tourism Federation. In 2020, he was set to star in the upcoming film The Clock: Red Wall directed by Cambodian director Leak Lyda. In December 2021, Paing Takhon was ranked #1 in "The 100 Most Handsome Faces of 2021" list issued by TC Candler.',
                      overflow: TextOverflow.clip,
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
                Image(
                  // width: screenWidth * 0.5,
                  // height: screenHeight * 0.5,
                  image: AssetImage('assets/picture.png'),
                ),
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
