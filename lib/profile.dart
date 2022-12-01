import 'package:AniRate/database.dart';
import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';
import 'animeProfile.dart';

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

  Widget profileRow(
    BuildContext context,
    Widget Title,
    List<AnimeInfo> animes,
    List<AnimeInfo> animeList,
    final PersonalInfo userData,
    final List<PersonalInfo> userList,
    {size: 'big'}) {
    double _padding_between = size == 'big' ? 12 : 8;
    double _height = size == 'big' ? 150 : 120;
    double _width = size == 'big' ? 110 : 88;
    double _padding_bottom = size == 'big' ? 18 : 12;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Title,
      SizedBox(height: _padding_between),
      Container(
        height: _height,
        child: ListView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          children: animes
              .map((anime) => GestureDetector(
                  onTap: () {
                    print(anime.AnimeId);
                    if(userData.SearchHistory.contains(anime.AnimeId)){
                      userData.SearchHistory.remove(anime.AnimeId);
                      userData.SearchHistory.insert(0, anime.AnimeId);
                    }
                    else{
                      userData.SearchHistory.removeLast();
                      userData.SearchHistory.insert(0, anime.AnimeId);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new AnimeProfile(
                                animeInfo: anime,
                                animeList: animeList,
                                userData: userData,
                                userList: userList,
                              )),
                    ).then((_){setState(() {});});
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: imageCard('assets/images/${anime.Cover}',
                        height: _height, width: _width),
                  )))
              .toList(),
        ),
      ),
      SizedBox(
        height: _padding_bottom,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _favorite.Results = _userData.Favorite.map((index) => animedatabase.animeList.where((anime) => anime.AnimeId == index).toList()[0]).toList();
    _favorite.Title = "Favorite Anime (${_favorite.Results.length})";
    _history.Results = _userData.SearchHistory.map((index) => animedatabase.animeList.where((anime) => anime.AnimeId == index).toList()[0]).toList();

    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          infoBlockListener(_userData, context, true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top:12, left:12, right: 12),
              children: [
                profileRow(context, bracketTitle(_favorite.Title, 18), _favorite.Results, _animeList, _userData, _userList),
                profileRow(context, bracketTitle(_history.Title, 18), _history.Results, _animeList, _userData, _userList),
                reviewRow(_animeList, _userData, _userList, true, size: "small"),
              ]
            )
          ),
        ]
      )
    );
  }
}
