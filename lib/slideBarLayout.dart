import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebaranimation/bloc/navigation_bloc.dart';
import 'package:sidebaranimation/pages/counterPage.dart';
import 'package:sidebaranimation/pages/homePage.dart';
import 'package:sidebaranimation/pages/myOrderPage.dart';
import 'package:sidebaranimation/slidebar.dart';

class SlideBarLayout extends StatefulWidget {
  @override
  _SlideBarLayoutState createState() => _SlideBarLayoutState();
}

class _SlideBarLayoutState extends State<SlideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocProvider<NavigationBloc>(
            create: (context) => new NavigationBloc(CounterPage()),
            child: Stack(
              children: <Widget>[
                BlocBuilder<NavigationBloc,Widget>(builder: (context, Widget widget){
                  return widget;
                }),
                SlideBar(),
              ],
            ),
          ),
        ));
  }
}
