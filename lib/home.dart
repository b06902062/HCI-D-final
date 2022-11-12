import 'package:flutter/material.dart';

Widget animeCard(String imageSrc) {
  return Container(
    height: 150,  // 155 = 150 animeCard height + 5 bottom margin
    width: 110,
    clipBehavior: Clip.hardEdge,
    margin: const EdgeInsets.only(left: 8.5, top: 0, right: 8.5, bottom: 0),  // 150 = 150 animeCard height + 0 bottom margin
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromARGB(0, 244, 67, 54),
    ),
    child: Image.asset(
      imageSrc,
      fit: BoxFit.fill,
    ),
  );
}

Widget recommendationText(String text) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 3.0),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 16, color: Color(0xFFD9D9D9), fontWeight: FontWeight.bold),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C3C3C),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              recommendationText("| Trending Now 〉"),
              Container(
                color: Color.fromARGB(0, 255, 193, 7),
                height: 150,  // 150 = 150 animeCard height + 0 bottom margin
                margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    animeCard("images/anime1.png"),
                    animeCard("images/anime2.png"),
                    animeCard("images/anime3.png"),
                    animeCard("images/anime4.png"),
                    animeCard("images/anime5.png"),
                  ],
                ),
              ),
              recommendationText("| Recommended to You 〉"),
              Container(
                color: const Color.fromARGB(0, 255, 193, 7),
                height: 150,  // 150 = 150 animeCard height + 0 bottom margin
                margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    animeCard("images/anime6.png"),
                    animeCard("images/anime7.png"),
                    animeCard("images/anime8.png"),
                    animeCard("images/anime9.png"),
                    animeCard("images/anime10.png"),
                  ],
                ),
              ),
              recommendationText("| This Season 〉"),
              Container(
                color: const Color.fromARGB(0, 255, 193, 7),
                height: 150,  // 150 = 150 animeCard height + 0 bottom margin
                margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    animeCard("images/anime11.png"),
                    animeCard("images/anime12.png"),
                    animeCard("images/anime13.png"),
                    animeCard("images/anime14.png"),
                    animeCard("images/anime15.png"),
                  ],
                ),
              ),
              recommendationText("| Since you like Attack on Titan 〉"),
              Container(
                color: const Color.fromARGB(0, 255, 193, 7),
                height: 150,  // 150 = 150 animeCard height + 0 bottom margin
                margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    animeCard("images/anime16.png"),
                    animeCard("images/anime17.png"),
                    animeCard("images/anime18.png"),
                    animeCard("images/anime19.png"),
                    animeCard("images/anime20.png"),
                  ],
                ),
              ),
              recommendationText("| Since you like comedy 〉"),
              Container(
                color: const Color.fromARGB(0, 255, 193, 7),
                height: 150,  // 150 = 150 animeCard height + 0 bottom margin
                margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    animeCard("images/anime21.png"),
                    animeCard("images/anime1.png"),
                    animeCard("images/anime2.png"),
                    animeCard("images/anime3.png"),
                    animeCard("images/anime4.png"),
                  ],
                ),
              ),
              recommendationText("| Since you like school 〉"),
              Container(
                color: const Color.fromARGB(0, 255, 193, 7),
                height: 150,  // 150 = 150 animeCard height + 0 bottom margin
                margin: const EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0),
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    animeCard("images/anime5.png"),
                    animeCard("images/anime6.png"),
                    animeCard("images/anime7.png"),
                    animeCard("images/anime8.png"),
                    animeCard("images/anime9.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}