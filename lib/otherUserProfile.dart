import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'utility.dart';
import 'profileUtility.dart';
import 'database.dart';

class OtherUserProfile extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userInfo;

  OtherUserProfile({super.key,  required this.animeList, required this.userInfo});

  @override
  _OtherUserProfile createState() => _OtherUserProfile();
}

class _OtherUserProfile extends State<OtherUserProfile> {

  //reference https://stackoverflow.com/questions/43485529/programmatically-scrolling-to-the-end-of-a-listview
  //reference https://stackoverflow.com/questions/54291245/get-y-position-of-container-on-flutter
  GlobalKey _comment_key = GlobalKey();
  List<AnimeInfo> _animeList = [];
  FavoriteAndHistory _favorite = FavoriteAndHistory("Favorite Anime", []);
  FavoriteAndHistory _history = FavoriteAndHistory("Search History", []);
  List<Review> _reviews = [];
  AnimeInfo SPYFAMILY = animedatabase.animeList[0];
  AnimeInfo ChainsawMan = animedatabase.animeList[1];
  AnimeInfo AttackonTitan = animedatabase.animeList[2];
  AnimeInfo DemonSlayer = animedatabase.animeList[3];


  @override
  void initState() {
    super.initState();
    _animeList = widget.animeList;
    _favorite.Results = _animeList;
    _favorite.Title = _favorite.Title + " (${_favorite.Results.length})";
    _history.Results = _animeList;
    _reviews = [
      Review(SPYFAMILY , DateTime.utc(2022, 11, 23), 100, 5.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
      Review(ChainsawMan, DateTime.utc(2022, 11, 19), 500, 3.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
      Review(AttackonTitan, DateTime.utc(2022, 11, 21), 10, 4.5, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
      Review(DemonSlayer, DateTime.utc(2022, 11, 22), 30, 2.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.", false, new TextEditingController()),
    ];
    _reviews.sort((b, a) => a.Likes.compareTo(b.Likes));
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> _notifier = ValueNotifier(false);
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          centerTitle: true,
          title: Text('${widget.userInfo.Name}'),
        ),
        body: Container(
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children:  [
                    infoBlockListener(widget.userInfo, context, false),
                    Container(
                      padding: const EdgeInsets.only(left:12, right: 12),
                      child: Column(
                        children: [
                          recommendationRow(context, bracketTitle(_favorite.Title, 22), _favorite.Results),
                          recommendationRow(context, bracketTitle(_history.Title, 22), _history.Results),
                          reviewRow(_reviews, false),
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
