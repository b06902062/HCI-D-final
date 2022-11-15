import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utility.dart';

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
      color: Colors.blueGrey.shade100,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // description
          Positioned(
            left: 120,
            top: 85,
            bottom: 5,
            right: 5,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.shade50
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text(Description, style: TextStyle(fontSize: 12)),
                )
            ),
          ),
          // information
          Positioned(
              left: 120,
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
                    SizedBox(height: 3),
                    Wrap(
                      spacing: 5,
                      children: (Tags as List).map((name) =>
                          tagButton(name, (){})
                      ).toList(),
                    ),
                  ]
              )
          ),
          //Image
          Positioned(
            left: 5,
            child: animeCard('assets/images/SPY.jpeg'),
          ),
          // ranking
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(children: [Positioned(
                  left: 5,
                  bottom: 2,
                  child: Text('1', style: TextStyle(color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold, fontSize: 20)),
                ),],),
              )
          ),
          // star
          Positioned(
            top: 5,
            right: 5,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidStar, color: Colors.yellowAccent.shade700, size: 16),
                Text(' 9.7', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'NotoSans')),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var _tagStatus = {'comedy': true, 'adventure': true, 'action': false, 'school': false, 'monster': false};
  var _sortStatus = {'score': true, 'time': false, 'popularity': false};
  var _animeList = [
    {'Id': 1, 'Name': 'SPY x FAMIlY', 'Author': 'Tatsuya Endo', 'Director': 'Kazuhiro Furuhashi', 'Tags': ['comedy', 'family'],
    'Description': 'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          // search bar
          Container(
            margin: EdgeInsets.only(top:8, left: 8, right:8),
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey.shade100,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      // TODO: Search function
                    });
                  },
                  icon: Icon(Icons.search, color: Colors.blueGrey.shade900)
                ),
                Text('spy', style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          // filter, sorter
          Container(
            margin: EdgeInsets.only(top:12, left: 8, right: 8),
            height: 24,
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
                        icon: Icon(FontAwesomeIcons.filter, color: Colors.blueGrey.shade100),
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
                          icon: Icon(FontAwesomeIcons.sort, color: Colors.blueGrey.shade100,)
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
