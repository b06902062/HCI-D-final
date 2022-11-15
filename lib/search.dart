import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utility.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var _tagStatus = {'comedy': false, 'adventure': false, 'action': true, 'school': false, 'monster': false};
  var _sortStatus = {'score': true, 'time': false, 'popularity': false};
  var searchBarText = 'type here to search';
  var _animeList = [
    {
      'Name': 'SPY x FAMIlY', 'Author': 'Tatsuya Endo', 'Director': 'Kazuhiro Furuhashi',
      'Tags': ['action', 'comedy', 'school'], 'Cover': 'assets/images/SPYxFamily.jpeg', 'Score': 8.6,
      'Description': 'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.',
    },
    {
      'Name': 'Chainsaw Man', 'Author': 'Tatsuki Fujimoto', 'Director': 'Ryu Nakayama',
      'Tags': ['adventure', 'action', 'monster'], 'Cover': 'assets/images/ChainsawMan.jpg', 'Score': 8.8,
      'Description': 'Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.',
    },
    {
      'Name': 'Attack on Titan', 'Author': 'Author: Hajime Isayama', 'Director': 'Tetsurô Araki',
      'Tags': ['monster', 'action', 'adventure'], 'Cover': 'assets/images/AttackOnTitan.jpg', 'Score': 9.0,
      'Description': 'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.',
    },
    {
      'Name': 'Demon Slayer', 'Author': 'Koyoharu Gotōge', 'Director': 'Sotozaki Haruo',
      'Tags': ['action', 'monster', 'adventure'], 'Cover': 'assets/images/DemonSlayer.jpg', 'Score': 8.7,
      'Description': 'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
    },
    {
      'Name': 'My Hero Academia', 'Author': 'Kôhei Horikoshi', 'Director': 'Kenji Nagasaki',
      'Tags': ['action', 'adventure', 'school'], 'Cover': 'assets/images/MyHeroAcademia.jpg', 'Score': 8.4,
      'Description': 'A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero.',
    },
    // {'Name': '', 'Author': '', 'Director': '', 'Tags': [], 'Cover': 'assets/images/', 'Score': 0, 'Description': '',},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          // search bar
          Container(
            margin: EdgeInsets.only(top:8, left: 8, right:8),
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueGrey.shade100,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      // TODO: Search function
                    });
                  },
                  icon: Icon(Icons.search, color: Colors.blueGrey.shade900)
                ),
                Text(searchBarText, style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          // filter, sorter
          Container(
            margin: EdgeInsets.only(top:12, left: 8, right: 8, bottom: 12),
            height: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // filter
                Positioned(
                  left: 0,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            //TODO: show filter
                          });
                        },
                        icon: Icon(FontAwesomeIcons.filter, color: Colors.blueGrey.shade100),
                      ),
                      // tags button
                      Wrap(
                        spacing: 5,
                        children: _tagStatus.entries.where((e)=>e.value).map((e) =>
                          tagButton(
                            e.key,
                            (){setState(() {_tagStatus[e.key] = !e.value;});},
                          )
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                // sorter
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      // sorts button
                      Wrap(
                        spacing: 5,
                        children: _sortStatus.entries.where((e)=>e.value).map((e) =>
                          sortButton(e.key, (){})
                        ).toList(),
                      ),
                      IconButton(
                          onPressed: (){
                            setState(() {
                              // TODO: show sorter
                            });
                          },
                          icon: Icon(FontAwesomeIcons.sort, color: Colors.blueGrey.shade100,)
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          // anime list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: _animeList.length,
              itemBuilder: (BuildContext context, int index) {
                return animeBlock(_animeList[index]);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
      )
    );
  }
}
