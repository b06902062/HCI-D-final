import 'package:flutter/material.dart';
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
    AnimeInfo('SPY x FAMILY', 'Tatsuya Endo', 'Kazuhiro Furuhashi', ['action', 'comedy', 'school'], 'SPYxFamily.jpeg', 8.6,
      'A spy on an undercover mission gets married and adopts a child as part of his cover. His wife and daughter have secrets of their own, and all three must strive to keep together.'
    ),
    AnimeInfo('Chainsaw Man', 'Tatsuki Fujimoto', 'Ryu Nakayama', ['adventure', 'action', 'monster'], 'ChainsawMan.jpg', 8.8,
      'Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.'
    ),
    AnimeInfo('Attack on Titan', 'Hajime Isayama', 'Tetsurô Araki', ['monster', 'action', 'adventure'], 'AttackOnTitan.jpg', 9.0,
      'After his hometown is destroyed and his mother is killed, young Eren Jaeger vows to cleanse the earth of the giant humanoid Titans that have brought humanity to the brink of extinction.',
    ),
    AnimeInfo('Demon Slayer', 'Koyoharu Gotōge', 'Sotozaki Haruo', ['action', 'monster', 'adventure'], 'DemonSlayer.jpg', 8.7,
      'A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.',
    ),
    AnimeInfo('My Hero Academia', 'Kôhei Horikoshi', 'Kenji Nagasaki', ['action', 'adventure', 'school'], 'MyHeroAcademia.jpg', 8.4,
      'A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          SizedBox(height: 8),
          // search bar
          Container(
            margin: EdgeInsets.only(left: 8, right:8),
            height: 48,
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
          SizedBox(height: 8),
          // filter, sorter
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            height: 36,
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
                        iconSize: 28,
                        icon: Icon(Icons.sort, color: Colors.blueGrey.shade100),
                      ),
                      // tags button
                      Wrap(
                        spacing: 4,
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
                        spacing: 4,
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
                          iconSize: 28,
                          icon: Icon(Icons.import_export, color: Colors.blueGrey.shade100,)
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // anime list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: _animeList.length,
              itemBuilder: (BuildContext context, int index) {
                return animeBlock(_animeList[index], context);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
      )
    );
  }
}
