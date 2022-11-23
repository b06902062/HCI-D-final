import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'utility.dart';

class AnimeProfile extends StatefulWidget {
  final AnimeInfo animeInfo;

  AnimeProfile({super.key, required this.animeInfo});

  @override
  _AnimeProfileState createState() => _AnimeProfileState();
}

class _AnimeProfileState extends State<AnimeProfile> {
  double _user_rating = -1;
  bool _user_favorite = false;
  var _user_comment = '';
  var _others_comments = [
    {
      'Name': 'Daan Aniki', 'Title': 'Historic Anime',
      'Comment': 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.',
      'Score': 9, 'Likes': 137,
    },{
      'Name': 'Nefu Aniki', 'Title': 'Historic Anime',
      'Comment': 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.',
      'Score': 9, 'Likes': 113,
    },{
      'Name': 'Nefu Aniki', 'Title': 'Historic Anime',
      'Comment': 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.',
      'Score': 9, 'Likes': 113,
    },{
      'Name': 'Nefu Aniki', 'Title': 'Historic Anime',
      'Comment': 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.',
      'Score': 9, 'Likes': 113,
    },
  ];
  final ScrollController _controller = ScrollController();
  GlobalKey _comment_key = GlobalKey();

  //reference https://stackoverflow.com/questions/43485529/programmatically-scrolling-to-the-end-of-a-listview
  //reference https://stackoverflow.com/questions/54291245/get-y-position-of-container-on-flutter
  void _scrollDown() {
    RenderBox box = _comment_key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    _controller.animateTo(
      _controller.position.pixels+y-100,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _title(String title){
    return Container(
        margin: EdgeInsets.only(left: 12),
        height: 36,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade300,
            border: Border(left: BorderSide(color: Colors.blueGrey.shade900, width: 4))
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SizedBox(width: 4,),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Icon(Icons.navigate_next, color: Colors.blueGrey.shade900,)
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          centerTitle: true,
          title: Text('${widget.animeInfo.Name}'),
        ),
        body: ListView(
          controller: _controller,
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
                  child: clickableBlockWithLabel(_user_rating==-1? Icon(Icons.star_border):Icon(Icons.star, color: specialTeal,), '',
                      '${widget.animeInfo.Score} (2k+)', _scrollDown
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: clickableBlockWithLabel(_user_favorite? Icon(Icons.favorite, color: specialIndigo,):Icon(Icons.favorite_border), '',
                      '1285', (){
                        setState(() {
                          _user_favorite = !_user_favorite;
                        });
                      }
                  ),
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
            Container(key: _comment_key,),
            _title('Comments'),
            // reference https://pub.dev/packages/flutter_rating_bar
            SizedBox(height: 12),
            // user comment
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blueGrey.shade50,
              ),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      imageCard('assets/images/person.jpg', height: 72, width: 72, radius: 36),
                      // rating star
                      // TODO: discuss thesis statement
                      Expanded(
                        child: Column(
                          // alignment: Alignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: specialTeal,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  _user_rating = rating;
                                });
                              },
                            ),
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 8, left: 40, right: 40),
                              child: TextField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Thesis statement (optional)',
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(4),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Container(
                    width: MediaQuery.of(context).size.width-48,
                    color: Colors.white,
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
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2,),
                ),
              ),
              child: Text('2k+ comments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
            Column(
              children: _others_comments.map((comment) => otherUserComment(comment)).toList(),
            ),
            SizedBox(height: 8),
          ],
        )
    );
  }
}
