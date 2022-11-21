import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utility.dart';

class PersonalInfo {
  final String Name;
  final String Photo;
  final String Description;
  final int Follower;
  final int Following;
  final List<Social> Media;

  PersonalInfo(this.Name, this.Photo, this.Description, this.Follower,
      this.Following, this.Media);
}

Widget infoBlock(PersonalInfo data) {
  return Container(
    margin: EdgeInsets.only(left: 8, right: 8),
    height: 175,
    child: Column(
      children: [
      // title
      Text(data.Name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      // user photo
      Container(
        height: 150,
        child: imageCard('assets/images/${data.Photo}',
            height: 108, width: 108, radius: 59),
      ),
      // follow
      // edit button
      // description
      // social media
      // description
    ]),
  );
}

Widget blockRow(String title, List<String> filePaths) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title,
        style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey.shade100,
            fontWeight: FontWeight.bold)),
    SizedBox(height: 8),
    Container(
      height: 120, // = imageCard height
      child: ListView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: filePaths
            .map((fp) => Container(
                  padding: EdgeInsets.only(left: 16),
                  child: imageCard(fp, height: 120, width: 88),
                ))
            .toList(),
      ),
    ),
    SizedBox(height: 12),
  ]);
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _blocks = [
    {
      'title': "| Favorite Anime 〉",
      'results': [
        "assets/images/anime3.png",
        "assets/images/anime2.png",
        "assets/images/anime1.png",
        "assets/images/anime5.png"
      ]
    },
    {
      'title': "| Search History 〉",
      'results': [
        "assets/images/anime3.png",
        "assets/images/anime4.png",
        "assets/images/anime6.png",
        "assets/images/anime7.png"
      ]
    },
  ];

  var _personalInfo = PersonalInfo('User', 'person.jpg',
      'I love anime.\nAttack on Titan best anime.', 5, 10, [
    Social('facebook', '123'),
    Social('instagram', '456'),
    Social('twitter', '789'),
    Social('ani.gamer', '0')
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
        // infoBlock(_personalInfo),
        Container(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: _blocks.map(
              (block) => blockRow(block['title'] as String,block['results'] as List<String>)
            ).toList()
          )
        )
      ],)
    );
  }
}
