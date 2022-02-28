import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/content_view.dart';
import 'package:portfolio_website/utils/tab_controller_handler.dart';
import 'package:portfolio_website/utils/view_wrapper.dart';
import 'package:portfolio_website/views/about_view.dart';
import 'package:portfolio_website/views/home_view.dart';
import 'package:portfolio_website/widgets/custom_tab.dart';
import 'package:portfolio_website/widgets/custom_tab_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double screenHeight;
  double screenWidth;
  double topPadding;
  double bottomPadding;
  double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Home'),
      content: HomeView(),
    ),
    ContentView(
      tab: CustomTab(title: 'About'),
      content: AboutView(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');
    return Scaffold(
      backgroundColor: Color(0xff1e1e24),
      key: scaffoldKey,
      endDrawer: drawer(),
      body: ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
    );
  }

  Widget desktopView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// Tab Bar
          Container(
            height: screenHeight * 0.05,
            child: CustomTabBar(
                controller: tabController,
                tabs: contentViews.map((e) => e.tab).toList()),
          ),

          /// Tab Bar View
          Container(
            height: screenHeight * 0.9,
            child: TabControllerHandler(
              tabController: tabController,
              child: TabBarView(
                controller: tabController,
                children: contentViews.map((e) => e.content).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: Container(
        width: screenWidth,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: screenWidth * 0.08,
                  icon: Icon(Icons.menu_rounded),
                  color: Colors.white,
                  splashColor: Colors.transparent,
                  onPressed: () => scaffoldKey.currentState.openEndDrawer()),
              Expanded(
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.vertical,
                  itemScrollController: itemScrollController,
                  itemCount: contentViews.length,
                  itemBuilder: (context, index) => contentViews[index].content,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawer() {
    return Container(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [
                Container(
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ] +
              contentViews
                  .map((e) => Container(
                        child: ListTile(
                          title: Text(
                            e.tab.title,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onTap: () {
                            itemScrollController.scrollTo(
                                index: contentViews.indexOf(e),
                                duration: Duration(milliseconds: 300));
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
