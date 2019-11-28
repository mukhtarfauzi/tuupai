import 'package:flutter/material.dart';
import 'package:tuupai/core/data/constant.dart';
import 'package:tuupai/ui/shares/colors.dart';
import 'package:tuupai/ui/shares/fonts.dart';
import 'package:tuupai/ui/shares/screen_size_util.dart';

class ExploreCategory extends StatefulWidget {
  @override
  _ExploreCategoryState createState() => _ExploreCategoryState();
}

class _ExploreCategoryState extends State<ExploreCategory>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<double> _tabViewHeight = [];

  double _subCategoryHeight = 60.0;

  double _subCategorySpacing = 10.0;

  double _currentTabViewHeight = 0;

  List<Tab> _buildTabs() {
    List<Tab> tabs = [];
    menuList.forEach((category) {
      tabs.add(Tab(
        text: category,
      ));
    });
    return tabs;
  }

  List<Widget> _buildTabView(BuildContext context) {
    List<Widget> views = [];
    menuList.forEach((category) {
      views.add(Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: _subCategorySpacing,
        children: <Widget>[
          for (String subCategory in menuMap[category])
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              color: searchBarColor,
              child: Container(
                  height: _subCategoryHeight,
                  width: screenWidth(context, divideBy: 2, reduceBy: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          subCategory,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(context, divideBy: 7),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Colors.black, Colors.transparent],
                            ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                tuupaiShimmer,
                              )),
                        ),
                      )
                    ],
                  )),
              onPressed: () {},
            )
        ],
      ));
    });
    return views;
  }

  void _countHeightPerView(){
    menuList.forEach((category) {
      int heightCount = (menuMap[category].length / 2).floor();
      heightCount = heightCount + (menuMap[category].length % 2);
      _tabViewHeight.add(heightCount * (_subCategoryHeight + _subCategorySpacing) + 16);
    });
    _currentTabViewHeight = _tabViewHeight[0];
  }

  @override
  void initState() {
    _countHeightPerView();
    _tabController = TabController(
      length: menuList.length,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _currentTabViewHeight = _tabViewHeight[_tabController.index];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Explore Kategori',
            style: TextStyle(
                fontFamily: quicksandFont,
                fontSize: 28,
                fontWeight: FontWeight.w900),
          ),
        ),
        TabBar(
          controller: _tabController,
          labelStyle: TextStyle(
              fontFamily: quicksandFont,
              color: Colors.white,
              fontWeight: FontWeight.w700),
          isScrollable: true,
          unselectedLabelColor: Theme.of(context).disabledColor,
          indicator: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          tabs: _buildTabs(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: screenWidth(context),
          height: _currentTabViewHeight,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: TabBarView(
            controller: _tabController,
            children: _buildTabView(context),
          ),
        )
      ],
    );
  }
}
