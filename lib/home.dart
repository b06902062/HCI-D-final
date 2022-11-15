import 'package:flutter/material.dart';
import 'utility.dart';

Widget recommendationRow(String title, List<String> filePaths) {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 22, color: Colors.blueGrey.shade100, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Container(
        height: 150,  // = animeCard height
        child: ListView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          children: filePaths.map((fp) =>
              Container(
                padding: EdgeInsets.only(left: 16),
                child: animeCard(fp),
              )
          ).toList(),
        ),
      ),
      SizedBox(height: 12),
    ]
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var recommendations = [
    {
      'title': "| Trending Now 〉",
      'results': [
        "assets/images/anime1.png",
        "assets/images/anime2.png",
        "assets/images/anime3.png",
        "assets/images/anime4.png",
        "assets/images/anime5.png"
      ]
    },
    {
      'title': "| Recommended to You 〉",
      'results': [
        "assets/images/anime6.png",
        "assets/images/anime7.png",
        "assets/images/anime8.png",
        "assets/images/anime9.png",
        "assets/images/anime10.png"
      ]
    },
    {
      'title': "| This Season 〉",
      'results': [
        "assets/images/anime11.png",
        "assets/images/anime12.png",
        "assets/images/anime13.png",
        "assets/images/anime14.png",
        "assets/images/anime15.png"
      ]
    },
    {
      'title': "| Since you like Attack on Titan 〉",
      'results': [
        "assets/images/anime16.png",
        "assets/images/anime17.png",
        "assets/images/anime18.png",
        "assets/images/anime19.png",
        "assets/images/anime20.png"
      ]
    },
    {
      'title': "| Since you like comedy 〉",
      'results': [
        "assets/images/anime21.png",
        "assets/images/anime1.png",
        "assets/images/anime2.png",
        "assets/images/anime3.png",
        "assets/images/anime4.png"
      ]
    },
    {
      'title': "| Since you like school 〉",
      'results': [
        "assets/images/anime5.png",
        "assets/images/anime6.png",
        "assets/images/anime7.png",
        "assets/images/anime8.png",
        "assets/images/anime9.png"
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: recommendations.map((recommendation)=>
          recommendationRow(recommendation['title'] as String, recommendation['results'] as List<String>)
        ).toList(),
      ),
    );
  }
}