import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileRow extends StatelessWidget {
  String infoLabel;
  String infoText;
  ProfileRow({
    this.infoLabel,
    this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    if (infoLabel == 'Facebook : ') {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infoLabel,
            ),
            InkWell(
              onTap: () async {
                String url = infoText;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Flexible(
                child: Text(
                  infoText,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (infoLabel == 'Instagram : ') {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infoLabel,
            ),
            InkWell(
              onTap: () async {
                String url = infoText;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Flexible(
                child: Text(
                  infoText,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (infoLabel == 'Twitter : ') {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infoLabel,
            ),
            InkWell(
              onTap: () async {
                String url = infoText;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Flexible(
                child: Text(
                  infoText,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
}
