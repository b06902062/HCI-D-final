import 'package:flutter/material.dart';
import 'utility.dart';
import 'animeProfile.dart';
import 'profileUtility.dart';

class ListPage extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;

  ListPage({super.key, required this.animeList, required this.userData, required this.userList});

  @override
  _ListPageState createState() => _ListPageState();
}

class UserList {
  String Title;
  bool isEditing = false;
  List<AnimeInfo> Results;
  TextEditingController _user_comment_controller;

  UserList(this.Title, this.Results): _user_comment_controller = new TextEditingController(text: Title);
}

Widget _checkPopup(BuildContext context, List<UserList> _user_lists, UserList list){
  return AlertDialog(
    backgroundColor: Colors.blueGrey.shade900,
    content: Wrap(children: [Text("Are you sure to delete ", style: TextStyle(color: Colors.blueGrey.shade100,)), Text("${list.Title}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,)), Text("?", style: TextStyle(color: Colors.blueGrey.shade100,))]),
    actions: [
      TextButton.icon(
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.close, color: Colors.red), 
        label: Text("CANCEL", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,))
      ),
      TextButton.icon(
        onPressed:  (){
            _user_lists.remove(list);
            Navigator.pop(context);
        },
        icon: Icon(Icons.check, color: Colors.green), 
        label: Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,))
      ),
    ],
  );
}

class _ListPageState extends State<ListPage> {
  List<AnimeInfo> _animeList = [];
  PersonalInfo _userData = PersonalInfo(-1, "", "", -1, -1, "", "", "", "", [], [], [], []);
  List<PersonalInfo> _userList = [];
  List<UserList> _user_lists = [];

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _userData = widget.userData;
    _userList = widget.userList;
    _user_lists = _userData.Lists;
    for(int i = 0; i < _user_lists.length; i++){
      _user_lists[i].isEditing = false;
    }
  }

  Widget listRow(UserList userlist){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              (userlist.isEditing && userlist.Title != "My favorite") ?
              Container(
                height: 32,
                width: MediaQuery.of(context).size.width - 160,
                padding: EdgeInsets.only(left:10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: TextField(
                  maxLength: 16,
                  decoration: InputDecoration(
                      counterText: '',
                  ),
                  textInputAction: TextInputAction.done,
                  controller: userlist._user_comment_controller,
                  onEditingComplete: (){setState(() {
                    userlist.Title = userlist._user_comment_controller.text;
                    userlist.isEditing = false;
                  });},
                ),
              )
                  : bracketTitle('${userlist.Title} (${userlist.Results.length})', 18),
              Spacer(),
              (userlist.isEditing) ?
                (userlist.Title != "My favorite") ?
              clickableBlockWithLabel(Icon(Icons.delete, color: Colors.red,), '', '', (){
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return _checkPopup(context, _user_lists, userlist);
                  }).then((_){setState(() {});});
                }
              )
                : Container()
              : Text(formatter.format(DateTime.now()), style: TextStyle(color: Colors.blueGrey.shade100, fontWeight: FontWeight.bold, fontSize: 14)),
              (userlist.isEditing && userlist.Title != "My favorite") ? SizedBox(width: 20,) : SizedBox(width: 3,),
              clickableBlockWithLabel(userlist.isEditing? Icon(Icons.check, color: Colors.green,): Icon(Icons.edit, color: Colors.blueGrey.shade100,), '', '', (){setState(() {
                if(userlist.isEditing){
                  userlist.Title = userlist._user_comment_controller.text;
                }
                userlist.isEditing = !userlist.isEditing;
              });},),
            ],
          ),
          userlist.isEditing?
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 174,
            child: ListView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              children: userlist.Results.map((anime) =>
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    children: [
                      imageCard('assets/images/${anime.Cover}', height: 150, width: 110),
                      SizedBox(height: 4,),
                      SizedBox(
                        height: 20,
                        width: 110,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ), 
                          onPressed: (){setState(() {
                            if(userlist.Results.length == 1 && userlist.Title != "My favorite"){
                              _user_lists.remove(userlist);
                            }
                            else{
                              (userlist.Title == "My favorite") ? widget.userData.Favorite.remove(anime.AnimeId): null;
                              userlist.Results.remove(anime);
                            }
                          });},
                          child: Text('delete', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                      )
                    ],
                  )
                )
              ).toList(),
            ),
          )
          : Container(
            margin: EdgeInsets.only(top: 12),
            height: 150,
            child: ListView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              children: userlist.Results.map((anime) =>
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => new AnimeProfile(animeInfo: anime, animeList: _animeList, userData: _userData, userList: _userList,)),
                        ).then((_){setState(() {});});
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 16),
                        child: imageCard('assets/images/${anime.Cover}', height: 150, width: 110),
                      )
                  )
              ).toList(),
            ),
          ),
          SizedBox(height: 16),
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: _user_lists.map((userlist)=>
          listRow(userlist)
        ).toList(),
      ),
    );
  }
}