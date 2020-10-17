import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:sidebaranimation/pages/homePage.dart';
import 'package:sidebaranimation/pages/myOrderPage.dart';
import 'package:sidebaranimation/pages/wishListPage.dart';

enum NavigationEvents {
  HomePageClickEvent,
  MyOrderPageClickEvent,
  WishListPageClickEvent,
}

class NavigationBloc extends Bloc<NavigationEvents, Widget> {
  NavigationBloc(Widget initialState) : super(initialState);


  @override
  Stream<Widget> mapEventToState(NavigationEvents event) async* {
    if (event == NavigationEvents.HomePageClickEvent) {
      yield HomePage();
    } else if (event == NavigationEvents.WishListPageClickEvent) {
      yield WishList();
    }
    if (event == NavigationEvents.MyOrderPageClickEvent) {
      yield MyOrder();
    }
  }
}
