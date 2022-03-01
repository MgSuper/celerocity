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
