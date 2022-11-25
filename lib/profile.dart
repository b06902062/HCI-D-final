import 'package:flutter/material.dart';
import 'utility.dart';

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
    _history.Results = _animeList;
    _reviews = [
      Review(SPYFAMILY , DateTime.utc(2022, 11, 23), 100, 5.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot."),
      Review(ChainsawMan, DateTime.utc(2022, 11, 19), 500, 3.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot."),
      Review(AttackonTitan, DateTime.utc(2022, 11, 21), 10, 4.5, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot."),
      Review(DemonSlayer, DateTime.utc(2022, 11, 22), 30, 2.0, "Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.Incredible, I honestly have to say that this could be the best anime ever due to its development and plot."),
    ];
    _reviews.sort((b, a) => a.Likes.compareTo(b.Likes));
  }


  var _personalInfo = PersonalInfo('User', 'person.jpg',
      'I love anime.\nAttack on Titan best anime.', 5, 10, 
      [
      Social('facebook', 'facebook.com/user'),
      Social('instagram', '@user'),
      Social('twitter', '@user'),
      ]
  );

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> _notifier = ValueNotifier(false);
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          infoBlock(_personalInfo),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left:12, right: 12),
              children:  [
                recommendationRow(context, _favorite.Title, _favorite.Results),
                recommendationRow(context, _history.Title, _history.Results),
                reviewRow(_reviews),
              ]
            )
          ),
        ]
      )
    );
  }
}
