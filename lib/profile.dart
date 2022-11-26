import 'package:flutter/material.dart';
import 'utility.dart';
import 'profileUtility.dart';

class ProfilePage extends StatefulWidget {
  final List<AnimeInfo> animeList;

  const ProfilePage({super.key, required this.animeList});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<AnimeInfo> _animeList = [];
  FavoriteAndHistory _favorite = FavoriteAndHistory("Favorite Anime", []);
  FavoriteAndHistory _history = FavoriteAndHistory("Search History", []);
  List<Review> _reviews = [];

  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _favorite.Results = _animeList;
    _favorite.Title = "${_favorite.Title} (${_favorite.Results.length})";
    _history.Results = _animeList;
    _reviews = [
      Review(_animeList[0] , DateTime.utc(2022, 11, 23), 100, 5.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
      Review(_animeList[1], DateTime.utc(2022, 11, 19), 500, 3.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
      Review(_animeList[2], DateTime.utc(2022, 11, 21), 10, 4.5, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
      Review(_animeList[3], DateTime.utc(2022, 11, 22), 30, 2.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
    ];
    _reviews.sort((b, a) => a.Likes.compareTo(b.Likes));
  }


  var _personalInfo = PersonalInfo('User', 'person.jpg',
      'I love anime.\nAttack on Titan best anime.', 5, 10, 
      'facebook','','@Twitter',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          infoBlockListener(_personalInfo, context, true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left:12, right: 12),
              children:  [
                recommendationRow(context, bracketTitle(_favorite.Title, 22), _favorite.Results),
                recommendationRow(context, bracketTitle(_history.Title, 22), _history.Results),
                reviewRow(_reviews, true),
              ]
            )
          ),
        ]
      )
    );
  }
}
