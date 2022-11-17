import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
  Overview
  animeCard (String imageSrc) { return anime cover }
  tagButton (String tagName, func) { return OutlineButton with text tagName and Onpressed func }
  sortButton (String sortName, func) { return ElevatedButton with text sortName and Onpressed func }
 */

class AnimeInfo {
  final String Name;
  final String Author;
  final String Director;
  final List<String> Tags;
  final String Cover;
  final double Score;
  final String Description;

  AnimeInfo(this.Name, this.Author, this.Director, this.Tags, this.Cover, this.Score, this.Description);
}

Widget animeCard(String imageSrc) {
  return Container(
    height: 150,  // 155 = 150 animeCard height + 5 bottom margin
    width: 110,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
    ),
    child: Image.asset(
      imageSrc,
      fit: BoxFit.fill,
    ),
  );
}

Widget tagButton(String tagName, func) {
  return SizedBox(
    height: 24,
    width: tagName.length*9.6,
    child: OutlinedButton(
      style: TextButton.styleFrom(
        primary: Colors.teal.shade400,
        padding: EdgeInsets.all(0),
        side: BorderSide(color: Colors.teal.shade400, width: 2),
        shape: StadiumBorder(),
      ),
      onPressed: func,
      child: Text(tagName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    ),
  );
}

Widget sortButton(String sortName, func) {
  return SizedBox(
      height: 24,
      width: sortName.length*9.6,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(0),
          shape: StadiumBorder(),
        ),
        onPressed: (){},
        child: Text(sortName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      )
  );
}

Widget animeBlock(AnimeInfo data, BuildContext context) {
  return  GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new AnimeProfile(animeInfo: data)),
      );
    },
    child: Container(
      margin: EdgeInsets.only(left: 8, right:8),
      height: 166,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blueGrey.shade100,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // description
          Positioned(
            left: 126,
            top: 96,
            bottom: 8,
            right: 8,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueGrey.shade50
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text(data.Description, style: TextStyle(fontSize: 12)),
                )
            ),
          ),
          // information
          Positioned(
              left: 126,
              top: 8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    // SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        text: 'Author: ',
                        style: TextStyle(fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(text: data.Author, style: TextStyle(decoration: TextDecoration.underline, fontSize: 12)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Director: ',
                        style: TextStyle(fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(text: data.Director, style: TextStyle(decoration: TextDecoration.underline, fontSize: 12)),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      children: (data.Tags as List).map((name) =>
                          tagButton(name, (){})
                      ).toList(),
                    ),
                  ]
              )
          ),
          //Image
          Positioned(
            left: 8,
            child: animeCard('assets/images/${data.Cover}'),
          ),
          //ranking seems not needed
          /*Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(children: [Positioned(
                  left: 5,
                  bottom: 2,
                  child: Text('1', style: TextStyle(color: Colors.blueGrey.shade900, fontWeight: FontWeight.bold, fontSize: 20)),
                ),],),
              )
          ),
          */
          // star
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidStar, color: Colors.yellowAccent.shade700, size: 16),
                Text(' ${data.Score}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class AnimeProfile extends StatefulWidget {
  final AnimeInfo animeInfo;

  AnimeProfile({super.key, required this.animeInfo});

  @override
  _AnimeProfileState createState() => _AnimeProfileState();
}

class _AnimeProfileState extends State<AnimeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        centerTitle: true,
        title: Text('${widget.animeInfo.Name}'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16,),
          // Fake Cover
          Container(
            margin: EdgeInsets.only(left: 32, right: 32),
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueGrey,
            ),
            child: Center(child: Text('Cover'),),
          ),
          SizedBox(height: 16,),
          // Author, Director, and Tags
          Row(
            children: [
              SizedBox(width: 16,),
              SizedBox(
                width: MediaQuery.of(context).size.width/2-16,
                child: Text.rich(
                  TextSpan(
                    text: 'Author: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(text: widget.animeInfo.Author, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.normal, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/2-16,
                child: Text.rich(
                  TextSpan(
                    text: 'Director: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(text: widget.animeInfo.Director, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.normal, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16,),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 16,),
              SizedBox(
                child: Text.rich(
                  TextSpan(
                    text: 'Tags: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
              Wrap(
                spacing: 8,
                children: (widget.animeInfo.Tags as List).map((name) =>
                    tagButton(name, (){})
                ).toList(),
              ),
            ]
          ),



          SizedBox(height: 1000,),
          Text('end'),
        ],
      )
    );
  }
}
