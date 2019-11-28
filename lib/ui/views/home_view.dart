import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuupai/ui/shares/colors.dart';
import 'package:tuupai/ui/shares/fonts.dart';
import 'package:tuupai/ui/shares/screen_size_util.dart';
import 'package:tuupai/ui/widgets/banner_adds.dart';
import 'package:tuupai/ui/widgets/explore_category.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _navigationSelected = 0;

  void _navigateTo(int navIndex) {
    setState(() {
      _navigationSelected = navIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenHeight(context), kToolbarHeight + 20),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: FlatButton(
              onPressed: () {},
              color: searchBarColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: searchTextColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Butuh jasa apa, Mukhtar Fauzi',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: searchTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: screenWidth(context),
              height:
                  screenHeight(context, divideBy: 2, reduceBy: kToolbarHeight),
              child: BannerAdds(),
            ),
            ExploreCategory(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Butuh jasa cleaning service?',
                style: TextStyle(
                    fontFamily: quicksandFont,
                    fontSize: 28,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationSelected,
          onTap: (navIndex) => _navigateTo(navIndex),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: accentColor,
          selectedIconTheme: IconThemeData(color: accentColor),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          showSelectedLabels: true,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              title: Text('Cari Jasa'),
              icon: Icon(FontAwesomeIcons.search),
            ),
            BottomNavigationBarItem(
              title: Text('Order'),
              icon: Badge(
                badgeContent: Text('3', style: TextStyle(color: Colors.white),),
                child: Icon(FontAwesomeIcons.tasks),
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Chat'),
              icon: Icon(FontAwesomeIcons.rocketchat),
            ),
            BottomNavigationBarItem(
              title: Text('Profil'),
              icon: Icon(FontAwesomeIcons.user),
            )
          ]),
    );
  }
}
