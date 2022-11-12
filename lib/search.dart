import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

Widget tagButton(tagName, func) {
  return OutlinedButton(
    style: TextButton.styleFrom(
      primary: Colors.teal,
      padding: EdgeInsets.all(0),
      side: BorderSide(color: Colors.teal, width: 2),
      shape: StadiumBorder(),
    ),
    onPressed: func,
    child: Text(tagName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
  );
}

Widget sortButton(sortName, func) {
  return ElevatedButton(
    style: TextButton.styleFrom(
      primary: Colors.white,
      padding: EdgeInsets.all(0),
      shape: StadiumBorder(),
    ),
    onPressed: (){},
    child: Text(sortName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
  );
}

Widget animeBlock(data) {
  var Id = data['Id'];
  var Name = data['Name'];
  var Author = data['Author'];
  var Director = data['Director'];
  var Tags = data['Tags'];
  var Description = data['Description'];

  return Container(
    margin: EdgeInsets.only(top:10, left: 10, right:10),
    height: 160,
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
            left: 115,
            top: 5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text.rich(
                    TextSpan(
                      text: 'Author: ',
                      style: TextStyle(fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(text: Author, style: TextStyle(decoration: TextDecoration.underline, fontSize: 12)),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Director: ',
                      style: TextStyle(fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(text: Director, style: TextStyle(decoration: TextDecoration.underline, fontSize: 12)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Wrap(
                    spacing: 5,
                    children: (Tags as List).map((name) =>
                      tagButton(name, (){})
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
                        child: Text(Description, style: TextStyle(fontSize: 12)),
                      )
                  ),
                ]
            )
          ),
          //Image
          Positioned(
            left: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('SPYxFamily.jpeg', height: 150),
            )
          ),
          // ranking
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(children: [Positioned(
                  left: 5,
                  bottom: 2,
                  child: Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),],),
              )
          ),
          // star
          Positioned(
            top: 5,
            right: 5,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidStar, color: Colors.yellow, size: 16),
                Text(' 9.7', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _SearchWidgetState extends State<SearchWidget> {
  bool _showResult = false;
  var _tagStatus = {'comedy': true, 'adventure': true, 'action': false, 'school': false, 'monster': false};
  var _sortStatus = {'score': true, 'time': false, 'popularity': false};
  var _animeList = [
    {'Id': 1, 'Name': 'SPY x FAMIlY', 'Author': 'Tatsuya Endo', 'Director': 'Kazuhiro Furuhashi', 'Tags': ['comedy', 'family'],
    'Description': 'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their ...    '}
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
                            //TODO: show filter
                          });
                        },
                        icon: Icon(FontAwesomeIcons.filter, color: Color.fromRGBO(217, 217, 217, 1),),
                      ),
                      // tags button
                      Wrap(
                        spacing: 5,
                        children: _tagStatus.entries.where((e)=>e.value).map((e) =>
                          tagButton(
                            e.key,
                            (){setState(() {_tagStatus[e.key] = !e.value;});},
                          )
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                // sorter
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      // sorts button
                      Wrap(
                        spacing: 5,
                        children: _sortStatus.entries.where((e)=>e.value).map((e) =>
                          sortButton(e.key, (){})
                        ).toList(),
                      ),
                      IconButton(
                          onPressed: (){
                            setState(() {
                              // TODO: show sorter
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
          animeBlock(_animeList[0]),
        ],
      )
    );
  }
}
