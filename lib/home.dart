import 'package:flutter/material.dart';
import 'utility.dart';

class HomePage extends StatefulWidget {
  final List<AnimeInfo> animeList;

  HomePage({super.key, required this.animeList});

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

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _recommendations = [
      new Recommendation('Trending Now', _animeList.sublist(1)),
      new Recommendation('Recommended to You', _animeList),
      new Recommendation('This Season', _animeList),
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
          recommendationRow(context, recommendation.Title, recommendation.Results,)
        ).toList(),
      ),
    );
  }
}