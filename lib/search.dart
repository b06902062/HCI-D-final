import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool _showResult = false;
  var _tagStatus = {'comedy': true, 'adventure': true, 'action': false, 'school': false, 'monster': false};
  var _sortStatus = {'score': true, 'time': false, 'popularity': false};
  var _animeList = [
    {'Name': 'SPYxFAMIlY', 'Author': 'Tatsuya Endo', 'Director': 'Kazuhiro Furuhashi', 'Tags': ['comedy', 'family']}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(60, 60, 60, 1),
      child: Column(
        children: [
          // search bar
          Container(
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
          // filter, sorter
          Container(
            margin: EdgeInsets.only(top:10, left: 10, right:10),
            height: 30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // filter
                Positioned(
                  left: 0,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            _showResult = !_showResult;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.filter, color: Color.fromRGBO(217, 217, 217, 1),),
                      ),
                      // tags button
                      Wrap(
                        spacing: 5,
                        children: _tagStatus.entries.where((e)=>e.value).map((e) =>
                          OutlinedButton(
                            style: TextButton.styleFrom(
                              primary: Colors.teal,
                              side: BorderSide(color: Colors.teal, width: 2),
                              shape: StadiumBorder(),
                            ),
                            onPressed: (){setState(() {
                              _tagStatus[e.key] = !e.value;
                            });},
                            child: Text(e.key, style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                // sorter icon
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      // sorts button
                      Wrap(
                        spacing: 5,
                        children: _sortStatus.entries.where((e)=>e.value).map((e) =>
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                shape: StadiumBorder(),
                              ),
                              onPressed: (){},
                              child: Text(e.key, style: TextStyle(fontWeight: FontWeight.bold)),
                            )
                        ).toList(),
                      ),
                      IconButton(
                          onPressed: (){
                            setState(() {
                              _showResult = !_showResult;
                            });
                          },
                          icon: Icon(FontAwesomeIcons.sort, color: Color.fromRGBO(217, 217, 217, 1),)
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          // anime block
          Container(
            margin: EdgeInsets.only(top:10, left: 10, right:10),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(230, 240, 250, 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // description
                  Positioned(
                    left: 5,
                    child: Wrap(
                      spacing: 5,
                      children: [
                        // image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('${_animeList[0]['Name']}.jpeg', height: 190),
                        ),
                        // description
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${_animeList[0]['Name']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(height: 5),
                            Text.rich(
                              TextSpan(
                                text: 'Author: ',
                                children: <TextSpan>[
                                  TextSpan(text: '${_animeList[0]['Author']}', style: TextStyle(decoration: TextDecoration.underline,)),// can add more TextSpans here...
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Director: ',
                                children: <TextSpan>[
                                  TextSpan(text: '${_animeList[0]['Director']}', style: TextStyle(decoration: TextDecoration.underline,)),// can add more TextSpans here...
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Wrap(
                              spacing: 5,
                              children: ['comedy', 'family'].map((name) =>
                                OutlinedButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.teal,
                                    side: BorderSide(color: Colors.teal, width: 2),
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: (){},
                                  child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                                )
                              ).toList(),
                            ),
                            SizedBox(height: 5),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                              ),
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Text('A spy on an undercover mission gets married and   adopts a child as part of his cover. His wife and   daughter have secrets of their own, and all three   must strive to keep together.  '),
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // ranking
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Stack(children: [Positioned(
                        left: 7.5,
                        bottom: 7.5,
                        child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      ),],),
                    )
                  ),
                  // star
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.solidStar, color: Colors.yellow),
                        Text(' 9.7', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
