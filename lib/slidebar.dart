import 'package:flutter/material.dart';
import 'package:sidebaranimation/bloc/navigation_bloc.dart';
import 'menuItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SlideBar extends StatefulWidget {
  @override
  _SlideBarState createState() => _SlideBarState();
}

class _SlideBarState extends State<SlideBar>
    with SingleTickerProviderStateMixin {
  bool isSlideBarOpen = false;

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        left: isSlideBarOpen ? 65 : screenWidth - 35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth - 100,
              height: screenHeight,
              color: Color(0xff262aaa),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new Column(
                children: [
                  new SizedBox(
                    height: 100,
                  ),
                  new ListTile(
                    onTap: (){
                      print('ontap');
                    },
                    title: new Text(
                      "MyApp",
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Container(
                      child: new Text(
                        'codeflow.ir',
                        style:
                            TextStyle(color: Color(0xff1bb5fd), fontSize: 15),
                      ),
                      margin: EdgeInsets.only(top: 7),
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new Divider(
                    height: 65,
                    color: Colors.white.withOpacity(0.5),
                    indent: 32,
                  ),
                  MenuItem(
                    icon: Icons.home,
                    title: "Home",
                    onTap: (){
                      context.bloc<NavigationBloc>().add(NavigationEvents.HomePageClickEvent);
                      setState(() {
                        isSlideBarOpen=!isSlideBarOpen;
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.shopping_basket,
                    title: "My order",
                    onTap: (){
                      context.bloc<NavigationBloc>().add(NavigationEvents.MyOrderPageClickEvent);
                      setState(() {
                        isSlideBarOpen=!isSlideBarOpen;
                      });
                    },
                  ),
                  MenuItem(
                    icon: Icons.card_giftcard,
                    title: "Wishlist",
                    onTap: (){
                      context.bloc<NavigationBloc>().add(NavigationEvents.WishListPageClickEvent);
                      setState(() {
                        isSlideBarOpen=!isSlideBarOpen;
                      });
                    },
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSlideBarOpen = !isSlideBarOpen;
                  });
                },
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    alignment: Alignment.center,
                    child: AnimatedIcon(
                        color: Color(0xff1bb5fd),
                        size: 25,
                        icon: !isSlideBarOpen
                            ? AnimatedIcons.menu_close
                            : AnimatedIcons.close_menu,
                        progress: _animationController.view),
                    color: Color(0xff262aaa),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(width, 0);
    path.quadraticBezierTo(width, 8, width - 10, 16);
    path.quadraticBezierTo(0, width, 0, height / 2);
    path.quadraticBezierTo(0, height - width, width - 10, height - 16);
    path.quadraticBezierTo(width, height - 8, width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
