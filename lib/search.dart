import 'package:flutter/material.dart';
import 'utility.dart';

class SearchWidget extends StatefulWidget {
  final List<AnimeInfo> animeList;

  SearchWidget({super.key, required this.animeList});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var _tagStatus = {'comedy': false, 'adventure': false, 'action': true, 'school': false, 'monster': false};
  var _sortStatus = {'score': true, 'time': false, 'popularity': false};
  var _searchBarText = 'type here to search';
  List<AnimeInfo> _animeList = [];
  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
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
                Text(_searchBarText, style: TextStyle(fontSize: 16),),
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
                          setState(() {
                            //TODO: show filter
                          });
                        },
                        iconSize: 28,
                        icon: Icon(Icons.sort, color: Colors.blueGrey.shade100),
                      ),
                      // tags button
                      Wrap(
                        spacing: 4,
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
                        spacing: 4,
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
