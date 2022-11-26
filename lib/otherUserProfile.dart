import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'utility.dart';
import 'profileUtility.dart';

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
  AnimeInfo SPYFAMILY = AnimeInfo('SPY x FAMILY', 'Tatsuya Endo', 'Kazuhiro Furuhashi', ['action', 'comedy', 'school'], 'SPYxFamily.jpeg', 8.6,
  'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.'
  );
  AnimeInfo ChainsawMan = AnimeInfo('Chainsaw Man', 'Tatsuki Fujimoto', 'Ryu Nakayama', ['adventure', 'action', 'monster'], 'ChainsawMan.jpg', 8.8,
      'Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.'
  );
  AnimeInfo AttackonTitan = AnimeInfo('Attack on Titan', 'Hajime Isayama', 'Tetsurô Araki', ['monster', 'action', 'adventure'], 'AttackOnTitan.jpg', 9.0,
    'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.',
  );
  AnimeInfo DemonSlayer = AnimeInfo('Demon Slayer', 'Koyoharu Gotōge', 'Sotozaki Haruo', ['action', 'monster', 'adventure'], 'DemonSlayer.jpg', 8.7,
    'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
  );


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
                          recommendationRow(context, _favorite.Title, _favorite.Results),
                          recommendationRow(context, _history.Title, _history.Results),
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
