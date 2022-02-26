import 'package:flutter/material.dart';
import 'package:portfolio_website/views/detail.dart';
import 'package:portfolio_website/widgets/home_item.dart';

class BuildMobileItem extends StatelessWidget {
  final List dataList;
  BuildMobileItem({
    this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: dataList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return HomeItem(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/detail',
                    arguments: dataList[index],
                  );
                },
                name: dataList[index]["name"],
                biography: dataList[index]["biography"],
                image: dataList[index]["image"],
              );
            }),
      ],
    );
  }
}
