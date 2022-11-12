import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(60, 60, 60, 1),
        child: Column(
          children: [
            Container( // search bar
              margin: EdgeInsets.only(top:10, left: 10, right:10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 10,
                    child: Text('spy', style: TextStyle(fontSize: 16)),
                  ),
                  Positioned(
                    right: 5,
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            _showResult = true;
                          });
                        },
                        icon: Icon(Icons.search)
                    ),
                  ),
                ],
              ),
            ),
            Container( // filter, sorter
              margin: EdgeInsets.only(top:10, left: 10, right:10),
              height: 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          _showResult = !_showResult;
                        });
                      },
                      icon: Icon(FontAwesomeIcons.filter, color: Color.fromRGBO(217, 217, 217, 1),),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            _showResult = !_showResult;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.sort, color: Color.fromRGBO(217, 217, 217, 1),)
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'showresult = ${_showResult}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        )
    );
  }
}
