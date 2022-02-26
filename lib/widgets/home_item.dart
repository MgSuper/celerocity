import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

double screenWidth;
double screenHeight;

class HomeItem extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String biography;
  final String image;
  const HomeItem({this.onTap, this.name, this.biography, this.image});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: screenHeight * 0.6,
            width: screenWidth * 0.6,
            child: CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              imageUrl: image,
              fit: BoxFit.cover,
              width: 500,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        Text(
          biography,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
