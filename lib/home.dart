import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';

class HomePage extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;

  HomePage({super.key, required this.animeList, required this.userData, required this.userList});

  @override
  _HomePageState createState() => _HomePageState();
}

class Recommendation {
  final String Title;
  final List<AnimeInfo> Results;

  Recommendation(this.Title, this.Results);
}

class _HomePageState extends State<HomePage> {
  List<AnimeInfo> _animeList = [];
  List<Recommendation> _recommendations = [];
  PersonalInfo _userData = PersonalInfo(-1, "", "", -1, -1, "", "", "", "", [], [], [], []);
  List<PersonalInfo> _userList = [];

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _userData = widget.userData;
    _userList = widget.userList;

    _animeList.sort((b, a) =>a.Time.compareTo(b.Time));
    _recommendations.add(new Recommendation('Trending Now', _animeList.sublist(0, 5)));
    _animeList.sort((b, a) =>a.Score.compareTo(b.Score));
    _recommendations.add(new Recommendation('Recommended to You', _animeList.sublist(0, 5)));
    _recommendations += [
      new Recommendation('This Season', _animeList.where((anime) => anime.Status.contains('new season')).toList()),
      new Recommendation(
          'Since you like Attack on Titan',
          _animeList.where((anime) =>
              anime.Tags.contains('monster') && anime.Tags.contains('action') && anime.Tags.contains('adventure')
          ).toList()
      ),
      new Recommendation(
          'Since you like comedy',
          _animeList.where((anime) => anime.Tags.contains('comedy')).toList()
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: _recommendations.map((recommendation)=>
          recommendationRow(context, bracketTitle(recommendation.Title, 22), recommendation.Results, _animeList, _userData, _userList,)
        ).toList(),
      ),
    );
  }
}