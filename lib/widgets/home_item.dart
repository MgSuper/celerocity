import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double screenWidth;
double screenHeight;

class HomeItem extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String biography;
  const HomeItem({
    this.onTap,
    this.name,
    this.biography
  });

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      InkWell(
        onTap: onTap,
        child: Text(
          name,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      SizedBox(
        height: screenHeight * 0.03,
      ),
      InkWell(
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => Detail()),
        //   );
        // },
        onTap: onTap,
        child: Image.asset(
          'assets/project2.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01,
        ),
        child: Text(
          biography,
          overflow: TextOverflow.clip,
        ),
      )
    ]);
  }
}
