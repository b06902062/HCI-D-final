import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'animeProfile.dart';

class HomePage extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;
  final Function redirect;

  HomePage({super.key, required this.animeList, required this.userData, required this.userList, required this.redirect});

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

  int _showing_image_index = 0;
  final CarouselController _image_controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _userData = widget.userData;
    _userList = widget.userList;

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
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(child: Image.asset('assets/icon/icon.png', width: 28, height: 28,)),
                  TextSpan(text: ' AniRate', style: TextStyle(fontSize: 24, color: Colors.blueGrey.shade100,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12, bottom: 16),
            child: CarouselSlider(
              items: _animeList.sublist(0, 5).map((anime) =>
                GestureDetector(
                  onTap: () {
                    if(_userData.SearchHistory.contains(anime.AnimeId)){
                      _userData.SearchHistory.remove(anime.AnimeId);
                      _userData.SearchHistory.insert(0, anime.AnimeId);
                    } else {
                      _userData.SearchHistory.removeLast();
                      _userData.SearchHistory.insert(0, anime.AnimeId);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new AnimeProfile(
                          animeInfo: anime,
                          animeList: _animeList,
                          userData: _userData,
                          userList: _userList,
                          redirect: widget.redirect,
                        )
                      ),
                    ).then((_){null!();});
                  },
                  child: imageCard('assets/images/${anime.Cover}', fit: false),
                )
              ).toList(),
              carouselController: _image_controller,
              options: CarouselOptions(
                aspectRatio: 11/5,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                viewportFraction: 1/3,
                onPageChanged: (index, reason) {
                  setState(() {_showing_image_index = index;});
                }
              ),
            ),
          ),
        ] + _recommendations.map((recommendation)=>
          recommendationRow(context, bracketTitle(recommendation.Title, 18), recommendation.Results, _animeList, _userData, _userList, redirect: widget.redirect)
        ).toList(),
      ),
    );
  }
}