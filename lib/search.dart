import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';

class SearchWidget extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;
  final Function redirect;

  SearchWidget({super.key, required this.animeList, required this.userData, required this.userList, required this.redirect});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // action, adventure, comedy, monster, school, family, supernatural, sports, fantasy
  var _typeTagStatus = {'comedy': false, 'adventure': false, 'action': false, 'school': false, 'monster': false, 'fantasy': false, 'sports': false, 'supernatural': false};
  var _statusTagStatus = {'in progress': false, 'ended': false, 'new season': false, 'all': true};
  var _sortStatus = ['score', 'recent'];
  int _sortStatusIndex = 0;
  bool _sortReverseOrder = false;
  var searchBarText = 'type here to search';
  List<AnimeInfo> _animeList = [];
  PersonalInfo _userData = PersonalInfo(-1, "", "", -1, -1, "", "", "", "", [], [], [], []);
  List<PersonalInfo> _userList = [];

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _userData = widget.userData;
    _userList = widget.userList;
  }

  void refresh() {
    setState(() {    });
  }

  List<AnimeInfo> filteredList(List<AnimeInfo> animeList){
    if(_statusTagStatus['all']!){
      return animeList.where((anime) =>
        _typeTagStatus.keys.where((e)=>_typeTagStatus[e] as bool).every((tag) => anime.Tags.contains(tag))
      ).toList();
    }
    return animeList.where((anime) =>
      _typeTagStatus.keys.where((e)=>_typeTagStatus[e] as bool).every((tag) => anime.Tags.contains(tag))
      && anime.Status.any((status)=>
        _statusTagStatus.keys.where((e)=>_statusTagStatus[e] as bool).contains(status)
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    for (String key in _typeTagStatus.keys) {
      if(SearchTypeStatus.typeTagStatus[key]!){
         _typeTagStatus[key] = true;
      }
      else{
        _typeTagStatus[key] = false;
      }
    }
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
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return undonePopup(context);
                      },
                    );
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
          SizedBox(height: 4),

          // filter, sorter
          Container(
            // color: Colors.orange,
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.green,
                  child: IconButton(
                    onPressed: (){
                      setState(
                        () {
                          showDialog(
                            context: context,
                            barrierColor: Colors.black54,
                            barrierDismissible: true,
                            barrierLabel: 'Label',
                            builder: (BuildContext dialogContext) {
                              return FilterPanel(typeTagStatus: _typeTagStatus, statusTagStatus: _statusTagStatus, notifyParent: refresh, parentContext: context);
                            },
                          );
                          
                        }
                      );
                    },
                    iconSize: 28,
                    icon: Icon(Icons.sort, color: Colors.blueGrey.shade100,),
                  ),
                ),
                Expanded(
                  // width: 200,
                  // color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.only(top: 12),
                    // color: Colors.blue,
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 2,
                      children: _typeTagStatus.entries.where((e)=>e.value).map((e) =>
                        tagButton(
                          e.key,
                          (){setState(() {_typeTagStatus[e.key] = !e.value; SearchTypeStatus.typeTagStatus[e.key] = !e.value;});},
                        )
                      ).toList(),
                      // +_statusTagStatus.entries.where((e)=>e.value).map((e) =>
                      //   tagButton(
                      //     e.key,
                      //     (){setState(() {_statusTagStatus[e.key] = !e.value;});},
                      //   )
                      // ).toList(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: sortButton(_sortStatus[_sortStatusIndex], (){
                    setState(() {
                      _sortStatusIndex += 1; 
                      _sortStatusIndex %= _sortStatus.length;
                    });
                  }),
                ),
                IconButton(
                    onPressed: (){
                      setState(() {
                        // TODO: reverse sorter
                        setState(() {
                          _sortReverseOrder = !_sortReverseOrder;
                        });
                      });
                    },
                    iconSize: 28,
                    icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          Color leftColor = _sortReverseOrder ? Colors.blueGrey.shade100 : specialTeal;
                          Color rightColor = !_sortReverseOrder ? Colors.blueGrey.shade100 : specialTeal;
                          
                          return LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 0.5, 0.5, 1.0],
                            colors: <Color>[leftColor, leftColor, rightColor, rightColor],
                          ).createShader(bounds);
                        },
                       
                        child: Icon(Icons.import_export, color: Colors.blueGrey.shade100,)
                    )
                    
                ),
                
              ]
            )
          ),
          
          SizedBox(height: 4),
          // anime list
          filteredList(_animeList).length == 0?
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text('Your search did not match any animes. Try other keywords or reduce some filters.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey.shade100,
              )
            ),
          )
          : Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: filteredList(_animeList).length,

              itemBuilder: (BuildContext context, int index) {
                List<AnimeInfo> filtered = filteredList(_animeList);
                if(_sortReverseOrder)
                  filtered.sort((a, b) => _sortStatusIndex == 0? a.Score.compareTo(b.Score) : a.Time.compareTo(b.Time));
                else
                  filtered.sort((b, a) => _sortStatusIndex == 0? a.Score.compareTo(b.Score) : a.Time.compareTo(b.Time));
                return animeBlock(filtered[index], _animeList, _userData, _userList, refresh, context, widget.redirect);
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
  final BuildContext parentContext;
  FilterPanel({required this.typeTagStatus, required this.statusTagStatus, required this.notifyParent, required this.parentContext});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return filterPanel(context, setState, widget.typeTagStatus, widget.statusTagStatus, widget.notifyParent, widget.parentContext);
  }
}


Widget filterPanel(BuildContext context, StateSetter setState, Map typeTagStatus, Map statusTagStatus, Function notifyParent, BuildContext parentContext) {
  return 
    Stack(
    // alignment: Alignment(-1, -1),
      children: [
        Positioned(
          left: 6,
          top: 67 - MediaQuery.of(parentContext).viewPadding.top,
          child: Container(
            // height: 170,
            width: MediaQuery.of(context).size.width - 12,
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
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent, 
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){Navigator.pop(context);},
                      icon: Icon(
                        Icons.sort,
                        color:
                            Colors.blueGrey.shade100,
                        size: 28,
                      ),
                    )
                  )
                ),
                Container(
                  // height: 140,
                  color: Colors.blueGrey.shade900,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bracketTitle('Type', 16),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 12),
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 2,
                          children: typeTagStatus.entries.where((e)=>true).map((e) =>
                            tagButton(
                              e.key,
                              (){
                                setState(() {typeTagStatus[e.key] = !e.value; SearchTypeStatus.typeTagStatus[e.key] = !e.value;}); notifyParent();
                              },
                              fill: e.value,
                            )
                          ).toList(),
                        ),
                      ),
                      bracketTitle('Status', 16),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 12),
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 2,
                          children: statusTagStatus.entries.where((e)=>true).map((e) =>
                            tagButton(
                              e.key,
                              (){setState(() {for (String key in statusTagStatus.keys) {statusTagStatus[key] = false;} statusTagStatus[e.key] = true;}); notifyParent();},
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

class SearchTypeStatus {
  static var typeTagStatus = 
  {
    'comedy': false, 
    'adventure': false, 
    'action': false, 
    'school': false, 
    'monster': false, 
    'fantasy': false, 
    'sports': false, 
    'supernatural': false
  };
}