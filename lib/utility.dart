import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
  Class:
    - AnimeInfo(7 variables)
    - AnimeProfile(AnimeInfo animeInfo)

  Widgets:
    - imageCard (String imageSrc, height: 150, width: 110) { return anime cover in height 150 and border-radius 4 }
    - tagButton (String tagName, func) { return OutlineButton with text tagName and Onpressed func }
    - sortButton (String sortName, func) { return ElevatedButton with text sortName and Onpressed func }
    - animeBlock(AnimeInfo data, BuildContext context) { return a anime block in search page }

  Tricks:
    - MediaQuery.of(context).size.width - get the screen size
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

Widget imageCard(String imageSrc, {double height: 150, double width: 110, double radius: 4}) {
  return Container(
    height: height,
    width: width,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
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

Widget clickableBlockWithLabel(Icon icon, String display, String label, func) {
  return  GestureDetector(
    onTap: func,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            Text(display),
          ],
        ),
        Text(label),
      ],
    ),
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
            child: imageCard('assets/images/${data.Cover}'),
          ),
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
  Widget _title(String title){
    return Container(
      margin: EdgeInsets.only(left: 12),
      height: 36,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade300,
        border: Border(left: BorderSide(color: Colors.blueGrey, width: 4))
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          SizedBox(width: 4,),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Icon(Icons.chevron_right, color: Colors.blueGrey,)
        ],
      )
    );
  }

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
          // Fake Cover
          SizedBox(height: 16,),
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

          // Author, Director
          Row(
            children: [
              SizedBox(width: 12,),
              SizedBox(
                child: Text.rich(
                  TextSpan(
                    text: 'Author: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(text: widget.animeInfo.Author, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16,),
              SizedBox(
                // width: MediaQuery.of(context).size.width/2-16,
                child: Text.rich(
                  TextSpan(
                    text: 'Director: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(text: widget.animeInfo.Director, style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Tags
          Row(
            children: [
              SizedBox(width: 12,),
              SizedBox(
                child: Text.rich(
                  TextSpan(
                    text: 'Tags: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
          SizedBox(height: 12),

          // Description
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blueGrey.shade50
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(widget.animeInfo.Description),
              )
            ),
          ),
          SizedBox(height: 12),

          // Four Icons
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: clickableBlockWithLabel(Icon(Icons.star_border), '${widget.animeInfo.Score} (2k+)', 'AniRate', (){}),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: clickableBlockWithLabel(Icon(Icons.heart_broken), '1285', 'Favorite', (){}),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: clickableBlockWithLabel(Icon(Icons.playlist_add_outlined), '', 'Add to List', (){}),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/4,
                child: clickableBlockWithLabel(Icon(Icons.share), '', 'Share', (){}),
              )
            ],
          ),
          SizedBox(height: 16),

          // Platforms
          _title('Platforms'),
          SizedBox(height: 12),
          Container(
            height: 108,
            child: ListView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              children: ['amazon.png', 'anigamer.png', 'disney.jpg', 'HBO.png', 'netflix.png'].map((fp) =>
                Container(
                  padding: EdgeInsets.only(left: 12),
                  child: imageCard('assets/images/${fp}', height: 108, width: 108),
                )
              ).toList(),
            ),
          ),
          SizedBox(height: 16),

          // Casts & Staff
          _title('Casts & Staff'),
          SizedBox(height: 12),
          Container(
            // FIX: take off fix height
            height: 162,
            child: ListView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              children: ['dfjkaljf jdfisljs', 'erwefiajf', 'jijsdifjsl', 'dsjifjal', 'dsfishjh'].map((name) =>
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        imageCard('assets/images/person.jpg', height: 108, width: 108, radius: 59),
                        Text.rich(
                          TextSpan(
                            text: name,
                            style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          )
                        ),
                        Text.rich(
                            TextSpan(
                              text: 'as ${name}',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                        )
                      ],
                    ),
                  )
              ).toList(),
            ),
          ),

          // Episodes
          // _title('Episodes'),
          // SizedBox(height: 16),

          // Comments
          _title('Comments'),
          // rating star https://stackoverflow.com/questions/46637566/how-to-create-rating-star-bar-properly
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 8,),
                Row(
                  children: [
                    SizedBox(width: 8,),
                    imageCard('assets/images/person.jpg', height: 72, width: 72, radius: 36),
                    // TODO: add rating star
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  width: MediaQuery.of(context).size.width-48,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Leave your comment and rating',
                    ),
                  ),
                ),
                SizedBox(height: 8,),
              ],
            ),
          ),
          SizedBox(height: 200,)
        ],
      )
    );
  }
}

class Social{
  final String Media;
  final String Url;

  Social(this.Media, this.Url);
}

class PersonalInfo{
  final String Name;
  final String Photo;
  final String Description;
  final int Follower;
  final int Following;
  final List<Social> Media;

  PersonalInfo(this.Name, this.Photo, this.Description, this.Follower, this.Following, this.Media);
}