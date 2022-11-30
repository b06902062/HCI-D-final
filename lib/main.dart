import 'package:AniRate/database.dart';
import 'package:AniRate/otherUserProfile.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'lists.dart';
import 'profile.dart';
import 'utility.dart';
import 'database.dart';
import 'profileUtility.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AniRate',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // load data from local
  var _animeList;
  var _userData;
  var _userList;

  // reference https://karthikponnam.medium.com/flutter-pageview-withbottomnavigationbar-fb4c87580f6a
  int _panelIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    _animeList = animedatabase.animeList;
    _userData = userdata.userData;
    _userList = userdatabase.userList;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade900,
        child: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _panelIndex = index;
              });
            },
            children: [
              HomePage(animeList: _animeList, userData: _userData, userList: _userList, ),
              SearchWidget(animeList: _animeList, userData: _userData, userList: _userList,),
              ListPage(animeList: _animeList, userData: _userData, userList: _userList,),
              ProfilePage(animeList: _animeList, userData: _userData, userList: _userList,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey.shade700,
        selectedItemColor: Colors.blueGrey.shade100,
        unselectedItemColor: Colors.blueGrey.shade900,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _panelIndex,
        onTap: (index) {
          setState(() {
            _panelIndex = index;
            pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'list'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}