import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _panelIndex = 0;
  List<Widget> _panelOption = <Widget>[
    HomePage(),
    SearchWidget(),
    Icon(Icons.person, size: 200.0,),
  ];
  void _onItemTap(int index) {
    setState(() => _panelIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _panelOption.elementAt(_panelIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(30, 30, 30, 1),
          selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
          unselectedItemColor: Color.fromRGBO(127, 127, 127, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,

          onTap: _onItemTap,
          currentIndex: _panelIndex,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ],
        ),
    );
  }
}