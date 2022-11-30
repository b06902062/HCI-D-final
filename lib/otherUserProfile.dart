import 'package:AniRate/database.dart';
import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';

class OtherUserProfile extends StatefulWidget {
   final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;
  final int id;

  OtherUserProfile({super.key, required this.animeList, required this.userData, required this.userList, required this.id});

  @override
  _OtherUserProfile createState() => _OtherUserProfile();
}

class _OtherUserProfile extends State<OtherUserProfile> {

  //reference https://stackoverflow.com/questions/43485529/programmatically-scrolling-to-the-end-of-a-listview
  //reference https://stackoverflow.com/questions/54291245/get-y-position-of-container-on-flutter
  List<AnimeInfo> _animeList = [];
  FavoriteAndHistory _favorite = FavoriteAndHistory("Favorite Anime", []);
  FavoriteAndHistory _history = FavoriteAndHistory("Search History", []);
  List<Review> _reviews = [];
  PersonalInfo _userData = PersonalInfo(-1, "", "", -1, -1, "", "", "", "", [], [], [], []);
  List<PersonalInfo> _userList = [];
  int _id = -1;

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _userData = widget.userData;
    _userList = widget.userList;
    _id = widget.id;
    _favorite.Results = _userList[_id].Favorite.map((index) => animedatabase.animeList.where((anime) => anime.AnimeId == index).toList()[0]).toList();
    _favorite.Title = "${_favorite.Title} (${_favorite.Results.length})";
    _history.Results = _userList[_id].SearchHistory.map((index) => animedatabase.animeList.where((anime) => anime.AnimeId == index).toList()[0]).toList();
    _userList[_id].Reviews.sort((b, a) => a.Likes.compareTo(b.Likes));
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> _notifier = ValueNotifier(false);
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          centerTitle: true,
          title: Text('${_userList[_id].Name}'),
        ),
        body: Container(
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children:  [
                    infoBlockListener(_userList[_id], context, false),
                    Container(
                      padding: const EdgeInsets.only(left:12, right: 12),
                      child: Column(
                        children: [
                          recommendationRow(context, bracketTitle(_favorite.Title, 22), _favorite.Results, _animeList, _userData, _userList,),
                          reviewRow(_animeList, _userData, _userList, false, id: _id),
                        ],
                      ),
                    )
                  ]
                )
              ),
            ]
          )
        )
    );
  }
}
