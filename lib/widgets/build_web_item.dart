import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/home_item.dart';

class BuildWebItem extends StatelessWidget {
  final List dataList;
  BuildWebItem({
    this.dataList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: dataList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(),
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
      },
    );
  }
}
