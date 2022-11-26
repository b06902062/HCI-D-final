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
  bool _user_favorite = false;
  bool _user_rated = false;
  double _user_rating = -1;
  final TextEditingController _user_comment_controller = new TextEditingController();
  // TODO: add to animeInfo
  // List<String> showingImages = ['assets/images/SPYxFamily00.jpg', 'assets/images/SPYxFamily01.jpg'];
  int _showing_image_index = 0;

  List<Comment> _others_comments = [
    Comment('Daan Aniki', DateTime.utc(2022, 11, 23), 137, 4.5, 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.', false),
    Comment('Nefu Aniki', DateTime.utc(2022, 11, 21), 79, 4, 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot. Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.', false),
    Comment('Xinyi Aniki', DateTime.utc(2022, 11, 17), 35, 4.5, 'Incredible, I honestly have to say that this could be the best anime ever due to its development and plot.', false),
  ];

  //reference https://stackoverflow.com/questions/43485529/programmatically-scrolling-to-the-end-of-a-listview
  //reference https://stackoverflow.com/questions/54291245/get-y-position-of-container-on-flutter
  final ScrollController _controller = ScrollController();
  GlobalKey _comment_key = GlobalKey();

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
            // Cover
            SizedBox(height: 16,),
            Row(
              // crossAxisAlignment: ,
              children: [
                SizedBox(width: 48, child: TextButton(onPressed: (){
                  setState(() {
                    _showing_image_index = (_showing_image_index+widget.animeInfo.LandScapes.length-1)%widget.animeInfo.LandScapes.length;
                  });
                }, child: Icon(Icons.keyboard_arrow_left)),),
                imageCard(
                  'assets/images/${widget.animeInfo.LandScapes[_showing_image_index]}',
                  width: MediaQuery.of(context).size.width-96,
                  height: MediaQuery.of(context).size.width*2/3-64
                ),
                SizedBox(width: 48, child: TextButton(onPressed: (){
                  setState(() {
                    _showing_image_index = (_showing_image_index+1)%widget.animeInfo.LandScapes.length;
                  });
                }, child: Icon(Icons.keyboard_arrow_right)),)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.animeInfo.LandScapes.map((fp) =>
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  height: 8, width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: fp == widget.animeInfo.LandScapes[_showing_image_index] ? Colors.blueGrey : null,
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 2,
                    ),
                  ),
                )
              ).toList(),
            ),
            SizedBox(height: 12,),

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
                  child: clickableBlockWithLabel(_user_rated? Icon(Icons.star, color: specialTeal,) : Icon(Icons.star_border), '',
                      '${widget.animeInfo.Score} (2k+)', _scrollDown
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: clickableBlockWithLabel(_user_favorite? Icon(Icons.favorite, color: specialIndigo,):Icon(Icons.favorite_border), '',
                      '${widget.animeInfo.Favorites+(_user_favorite? 1 : 0)}', (){
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
                children: widget.animeInfo.CastingInfos.map((mapping) =>
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          imageCard('assets/images/${mapping['img']}', height: 108, width: 108, radius: 59, fit: false),
                          Text.rich(
                              TextSpan(
                                text: mapping['name'],
                                style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                              )
                          ),
                          Text.rich(
                              TextSpan(
                                text: mapping['role'],
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
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blueGrey.shade50,
              ),
              child: Column(
                crossAxisAlignment: _user_rated? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8,),
                      imageCard('assets/images/person.jpg', height: 72, width: 72, radius: 36),
                      // rating star
                      Expanded(
                        child: Column(
                          children: [
                            RatingBar.builder(
                              ignoreGestures: _user_rated,
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
                          ]
                        ),
                      ),
                    ],
                  ),
                  _user_rated ?
                    _user_comment_controller.text.isEmpty?
                      Container()
                      : Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Text(_user_comment_controller.text, style: TextStyle(fontSize: 16)),
                        )
                      )
                  : Container(
                    margin: EdgeInsets.only(top: 8, bottom: 4),
                    width: MediaQuery.of(context).size.width-48,
                    color: Colors.white,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _user_comment_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Leave your comment and rating',
                      ),
                    ),
                  ),
                  _user_rated ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(formatter.format(DateTime.now()), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(width: 4,),
                      clickableBlockWithLabel(Icon(Icons.edit,), '', '', (){setState(() {_user_rated = false;});},),
                      SizedBox(width: 4,),
                    ],
                  ) : ElevatedButton(
                    onPressed: _user_rating == -1 ? null : (){
                      setState(() {
                        _user_rated = true;
                      });
                    },
                    child: Icon(Icons.send),
                  ),
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
