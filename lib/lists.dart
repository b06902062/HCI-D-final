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
  }

  Widget listRow(UserList userlist){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              userlist.isEditing?
              Container(
                height: 32,
                width: MediaQuery.of(context).size.width - 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: TextField(
                  maxLength: 16,
                  decoration: InputDecoration(
                      counterText: ''
                  ),
                  textInputAction: TextInputAction.done,
                  controller: userlist._user_comment_controller,
                  onEditingComplete: (){setState(() {
                    userlist.Title = userlist._user_comment_controller.text;
                    userlist.isEditing = false;
                  });},
                ),
              )
                  : bracketTitle('${userlist.Title} (${userlist.Results.length})', 22),
              Spacer(),
              Text(formatter.format(DateTime.now()), style: TextStyle(color: Colors.blueGrey.shade100, fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(width: 4,),
              clickableBlockWithLabel(Icon(Icons.edit, color: Colors.blueGrey.shade100,), '', '', (){setState(() {
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
                          onPressed: (){setState(() {
                            if(userlist.Results.length == 1){
                              _user_lists.remove(userlist);
                            }
                            else{
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
                        );
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