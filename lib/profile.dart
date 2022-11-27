import 'package:AniRate/database.dart';
import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';

class ProfilePage extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;

  const ProfilePage({super.key, required this.animeList, required this.userData, required this.userList});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  List<AnimeInfo> _animeList = [];
  FavoriteAndHistory _favorite = FavoriteAndHistory("Favorite Anime", []);
  FavoriteAndHistory _history = FavoriteAndHistory("Search History", []);
  List<Review> _reviews = [];
  PersonalInfo _userData = PersonalInfo(-1, "", "", -1, -1, "", "", "", "", [], [], [], []);
  List<PersonalInfo> _userList = [];

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _userData = widget.userData;
    _userList = widget.userList;
    _userData.Reviews.sort((b, a) => a.Likes.compareTo(b.Likes));
  }

  refresh() {
    // print("refresh");
    setState(() {    });
  }

  @override
  Widget build(BuildContext context) {
    _favorite.Title = "Favorite Anime (${_favorite.Results.length})";
    _favorite.Results = _userData.Favorite.map((index) => animedatabase.animeList[index]).toList();
    _history.Results = _userData.SearchHistory.map((index) => animedatabase.animeList[index]).toList();

    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          infoBlockListener(_userData, context, true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left:12, right: 12),
              children: [
                recommendationRow(context, bracketTitle(_favorite.Title, 22), _favorite.Results, _animeList, _userData, _userList),
                recommendationRow(context, bracketTitle(_history.Title, 22), _history.Results, _animeList, _userData, _userList),
                reviewRow(_animeList, _userData, _userList, true, notifier: refresh),
              ]
            )
          ),
        ]
      )
    );
  }
}
