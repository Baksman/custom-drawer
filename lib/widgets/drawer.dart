//import 'dart:developer';

import 'dart:developer';

import 'package:nice/model/nav_item.dart';
import 'package:nice/utils/theme.dart';
import 'package:nice/widgets/collapsing_item_tiles.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  bool isCollapsed = false;
  int currentSelectedIndex = 0;
  AnimationController animationController;
  Animation<double> widthAnimation;
  double minWidth = 70;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, widget) {
          return getWidget(context, widget);
        });
  }

  getWidget(BuildContext context, Widget widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          CollapsingItemTiles(
            animationController: animationController,
            title: "Baksman",
            icon: Icons.person,
          ),
          SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
                itemCount: navItem.length,
                itemBuilder: (context, index) {
                  return CollapsingItemTiles(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = index;
                      });
                    },
                    isSelected: currentSelectedIndex == index,
                    animationController: animationController,
                    title: navItem[index].title,
                    icon: navItem[index].icon,
                  );
                }),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
                isCollapsed
                    ? animationController.forward()
                    : animationController.reverse();
              });
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: animationController,
              //Icons.chevron_left,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
