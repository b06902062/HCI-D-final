import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'utility.dart';

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
  // reference https://karthikponnam.medium.com/flutter-pageview-withbottomnavigationbar-fb4c87580f6a

  int _panelIndex = 0;

  List<Widget> _panelOption = <Widget>[
    HomePage(),
    SearchWidget(),
    Container(color: Colors.blueGrey.shade900),
    Container(color: Colors.blueGrey.shade900),
  ];

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
      BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'list'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _panelIndex = index;
          });
        },
        children: _panelOption,
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
        items: buildBottomNavBarItems(),
      ),
    );
  }
}