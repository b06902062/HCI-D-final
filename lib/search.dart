import 'package:flutter/material.dart';
import 'utility.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var _typeTagStatus = {'comedy': false, 'adventure': false, 'action': true, 'school': false, 'monster': false, 'monster1': true, 'monster2': true, 'monster3': true};
  var _statusTagStatus = {'in progress': false, 'ended': false, 'new season': true};
  var _sortStatus = ['score', 'time', 'popularity'];
  int _sortStatusIndex = 0;
  var searchBarText = 'type here to search';
  var _animeList = [
    AnimeInfo('SPY x FAMILY', 'Tatsuya Endo', 'Kazuhiro Furuhashi', ['action', 'comedy', 'school'], 'SPYxFamily.jpeg', 8.6,
      'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.'
    ),
    AnimeInfo('Chainsaw Man', 'Tatsuki Fujimoto', 'Ryu Nakayama', ['adventure', 'action', 'monster'], 'ChainsawMan.jpg', 8.8,
      'Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.'
    ),
    AnimeInfo('Attack on Titan', 'Hajime Isayama', 'Tetsurô Araki', ['monster', 'action', 'adventure'], 'AttackOnTitan.jpg', 9.0,
      'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.',
    ),
    AnimeInfo('Demon Slayer', 'Koyoharu Gotōge', 'Sotozaki Haruo', ['action', 'monster', 'adventure'], 'DemonSlayer.jpg', 8.7,
      'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
    ),
    AnimeInfo('My Hero Academia', 'Kôhei Horikoshi', 'Kenji Nagasaki', ['action', 'adventure', 'school'], 'MyHeroAcademia.jpg', 8.4,
      'A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero.'
    ),
  ];

  void refresh() {
    setState(() {    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          SizedBox(height: 8),
          // search bar
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            padding: EdgeInsets.only(left: 0, right: 16),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(hintText: searchBarText, border: InputBorder.none,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // filter, sorter
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            height: 36,
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
                          setState(
                            () {
                              //TODO: show filter
                              showDialog(
                                context: context,
                                barrierColor: Colors.black54,
                                barrierDismissible: true,
                                barrierLabel: 'Label',
                                builder: (BuildContext context) {
                                  return FilterPanel(typeTagStatus: _typeTagStatus, statusTagStatus: _statusTagStatus, notifyParent: refresh);
                                },
                              );
                              
                            }
                          );
                        },
                        iconSize: 28,
                        icon: Icon(Icons.sort, color: Colors.blueGrey.shade100),
                      ),
                      // tags button
                      Wrap(
                        spacing: 4,
                        children: _typeTagStatus.entries.where((e)=>e.value).map((e) =>
                          tagButton(
                            e.key,
                            (){setState(() {_typeTagStatus[e.key] = !e.value;});},
                          )
                        ).toList() + 
                        _statusTagStatus.entries.where((e)=>e.value).map((e) =>
                          tagButton(
                            e.key,
                            (){setState(() {_statusTagStatus[e.key] = !e.value;});},
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
                        spacing: 4,
                        children: [
                          sortButton(_sortStatus[_sortStatusIndex], (){
                            setState(() {
                              _sortStatusIndex += 1; 
                              _sortStatusIndex %= _sortStatus.length;
                            });
                          })
                        ]
                      ),
                      IconButton(
                          onPressed: (){
                            setState(() {
                              // TODO: reverse sorter
                              
                            });
                          },
                          iconSize: 28,
                          icon: Icon(Icons.import_export, color: Colors.blueGrey.shade100,)
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // anime list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: _animeList.length,
              itemBuilder: (BuildContext context, int index) {
                return animeBlock(_animeList[index], context);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
      )
    );
  }

  

}


class FilterPanel extends StatefulWidget {
  final Map typeTagStatus;
  final Map statusTagStatus;
  final Function notifyParent;
  FilterPanel({required this.typeTagStatus, required this.statusTagStatus, required this.notifyParent});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return filterPanel(context, setState, widget.typeTagStatus, widget.statusTagStatus, widget.notifyParent);
  }
}


Widget filterPanel(BuildContext context, StateSetter setState, Map typeTagStatus, Map statusTagStatus, Function notifyParent) {
  return 
    Stack(
    // alignment: Alignment(-1, -1),
      children: [
        Positioned(
          left: 0,
          top: 40,
          child: Container(
            // height: 170,
            width: MediaQuery.of(context).size.width,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(10),
              // color: Colors.green,
            ),
            child: Column(
              children: [
                Container(
                  height: 30,
                  color: Color.fromARGB(255, 30, 30, 30),
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.sort,
                    color:
                        Colors.blueGrey.shade100,
                    size: 28,
                  ),
                ),
                Container(
                  // height: 140,
                  color: Colors.blueGrey.shade900,
                  child: Column(
                    children: [
                      Container(
                        height: 25,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          // color: Colors.red, 
                          border: Border(
                              left: BorderSide(
                                color: Colors.blueGrey.shade100,
                                width: 2,
                              ),
                          ),
                        ),
                        child: Text("Type 〉", style: TextStyle(fontSize: 16,color: Colors.blueGrey.shade100, fontWeight:FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
                        // color: Colors.blue, 
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 2,
                          children: typeTagStatus.entries.where((e)=>true).map((e) =>
                            tagButton(
                              e.key,
                              (){setState(() {typeTagStatus[e.key] = !e.value;}); notifyParent();},
                              fill: e.value,
                            )
                          ).toList(),
                        ),
                      ),
                      Container(
                        height: 25,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          // color: Colors.red, 
                          border: Border(
                              left: BorderSide(
                                color: Colors.blueGrey.shade100,
                                width: 2,
                              ),
                          ),
                        ),
                        child: Text("Status 〉", style: TextStyle(fontSize: 16,color: Colors.blueGrey.shade100, fontWeight:FontWeight.bold),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
                        // color: Colors.blue, 
                        child: Wrap(
                          spacing: 4,
                          runSpacing: 2,
                          children: statusTagStatus.entries.where((e)=>true).map((e) =>
                            tagButton(
                              e.key,
                              (){setState(() {statusTagStatus[e.key] = !e.value;}); notifyParent();},
                              fill: e.value,
                            )
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
}