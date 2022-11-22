import 'package:flutter/material.dart';
import 'utility.dart';

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
                  child: clickableBlockWithLabel(Icon(Icons.star_border), '', '${widget.animeInfo.Score} (2k+)', (){}),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: clickableBlockWithLabel(Icon(Icons.favorite_border), '', '1285', (){}),
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
