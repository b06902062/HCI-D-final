import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'utility.dart';
import 'lists.dart';
import 'profileUtility.dart';

class AnimeProfile extends StatefulWidget {
  final AnimeInfo animeInfo;
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;

  AnimeProfile({super.key, required this.animeInfo, required this.animeList, required this.userData, required this.userList});

  @override
  _AnimeProfileState createState() => _AnimeProfileState();
}

class _AnimeProfileState extends State<AnimeProfile> {
  bool _user_favorite = false;
  bool _user_rated = false;
  double _user_rating = -1;
  int _user_review_index = -1; 
  DateTime _user_review_time = DateTime.now().toUtc();
  final TextEditingController _user_comment_controller = new TextEditingController();
  // TODO: add to animeInfo
  // List<String> showingImages = ['assets/images/SPYxFamily00.jpg', 'assets/images/SPYxFamily01.jpg'];
  int _showing_image_index = 0;

  //reference https://stackoverflow.com/questions/43485529/programmatically-scrolling-to-the-end-of-a-listview
  //reference https://stackoverflow.com/questions/54291245/get-y-position-of-container-on-flutter
  final ScrollController _controller = ScrollController();
  final CarouselController _image_controller = CarouselController();

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
            // Icon(Icons.navigate_next, color: Colors.blueGrey.shade900,)
          ],
        )
    );
  }

  Widget _ListCover(UserList list){
    bool separate = list.Results.length != 1 ? true : false;
    UserList DoubledList = new UserList(" ", []);
    List<String> before = list.Results.map((result) => result.Name).toList();
    DoubledList.Results.addAll(list.Results);
    DoubledList.Results.addAll((list.Results.length == 2) ? list.Results.reversed : list.Results);
    return Container(
      height: 80,
      width: 80,
      child: separate ? 
        Row(
          children: [
            Column(
              children: [
                imageCard('assets/images/${DoubledList.Results[0].Cover}', height: 40, width: 40, fit: false),
                imageCard('assets/images/${DoubledList.Results[1].Cover}', height: 40, width: 40, fit: false),
              ],
            ),
            Column(
              children:[
                imageCard('assets/images/${DoubledList.Results[2].Cover}', height: 40, width: 40, fit: false),
                imageCard('assets/images/${DoubledList.Results[3].Cover}', height: 40, width: 40, fit: false),
              ]
            )
          ],
        )
        : imageCard('assets/images/${DoubledList.Results[0].Cover}', height: 80, width: 80, fit: false),
    );
  }

  Widget _ListBlock(UserList list){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
          _ListCover(list),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${list.Title}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey.shade100)),
              // SizedBox(height: 5,),
              Text("${list.Results.length} ${list.Results.length == 1 ? "anime" : "animes"}", style: TextStyle(color: Colors.blueGrey.shade400)),
            ],
          )
      ]
    );
  }

  Widget _existPopup(String name){
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade900,
      content: Wrap(
        children:[RichText(
            text: TextSpan(
              text: "${name}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,),
              children: [
                TextSpan(text: " is already in the list!", style: TextStyle(fontWeight: FontWeight.normal, color:Colors.blueGrey.shade100,)),
              ],
            ),
          )
        ]
    ),
      actions: [
        TextButton(child: Text("Understood", style: TextStyle(color: Colors.blueGrey.shade100,)), onPressed: (){Navigator.pop(context);}, )
      ],
    );
  }

  Widget _donePopup(String animeName, String listName){
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade900,
      content: Wrap(
        children:[RichText(
            text: TextSpan(
              text: "${animeName}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,),
              children: [
                TextSpan(text: " successfully added to ", style: TextStyle(fontWeight: FontWeight.normal, color:Colors.blueGrey.shade100,)),
                TextSpan(text: "${listName}", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.blueGrey.shade100,)),
              ],
            ),
          )
        ]
    ),
      actions: [
        TextButton(child: Text("Understood", style: TextStyle(color: Colors.blueGrey.shade100,)), onPressed: (){Navigator.pop(context);}, )
      ],
    );
  }

  Widget _newListPopup(PersonalInfo userData){
    TextEditingController titleController = new TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.blueGrey.shade900,
      title: Text("Add list", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,),),
      content: Container(
        margin: EdgeInsets.only(top: 8, bottom: 4),
        width: MediaQuery.of(context).size.width,
        child: TextField(
          style: TextStyle(color: Colors.blueGrey.shade100),
          // keyboardType: TextInputType.multiline,
          maxLines: 1,
          controller: titleController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: "List Name",
            labelStyle: TextStyle(color: Colors.blueGrey.shade400),
          ),
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.close, color: Colors.red), 
          label: Text("CANCEL", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,))
        ),
        TextButton.icon(
          onPressed:  (){
            if(!titleController.text.isEmpty){
              userData.Lists.add(UserList(titleController.text, [widget.animeInfo]));
              Navigator.pop(context);
              Navigator.pop(context);
            }
            else{
              null;
            }
          },
          icon: Icon(Icons.check, color: Colors.green), 
          label: Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,))
        ),
      ],
    );
  }

  Widget _listPopup(PersonalInfo userData){
    return Dialog(
      shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.blueGrey.shade400),  borderRadius: BorderRadius.all(Radius.circular(10.0))),
      insetPadding: EdgeInsets.only(top: 100, bottom: 100, left: 30, right: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child:
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey.shade900,
              title: Text('Add to list', style: TextStyle(color: Colors.blueGrey.shade50),),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                    color: Colors.blueGrey.shade400,
                ),
            )
            ),
            body: Container(
              color: Colors.blueGrey.shade900,
              child: 
                Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(12),
                        children: userData.Lists.map((list) => list.Title == "My favorite"? 
                          Container()
                          : 
                          GestureDetector(
                            onTap: (){
                              int animeIndex = list.Results.indexWhere((result) => result.AnimeId == widget.animeInfo.AnimeId);     
                              if(animeIndex != -1){
                                Future.delayed(
                                  const Duration(seconds: 0),
                                  () => showDialog(
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return _existPopup(widget.animeInfo.Name);
                                    },
                                  )
                                );
                              }
                              else{
                                list.Results.add(widget.animeInfo);
                                Future.delayed(
                                  const Duration(seconds: 0),
                                  () => showDialog(
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return _donePopup(widget.animeInfo.Name, list.Title);
                                    },
                                  )
                                );
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.all(8),
                                height: 100,  
                                child: _ListBlock(list),),
                          )
                        ).toList(),
                      ),
                    ),
                  ],
                ), 
            ),
            floatingActionButton: FloatingActionButton(
              // backgroundColor: Colors.transparent,
              // foregroundColor: Colors.blueGrey.shade100,
              // elevation: 0,
              child: Icon(Icons.add),
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return _newListPopup(widget.userData);
                  },
                );
              },
            ),
          ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _user_review_index = widget.userData.Reviews.indexWhere((review) => review.AnimeId == widget.animeInfo.AnimeId);
    _user_rated = (_user_review_index != -1) ? true : false;
    _user_comment_controller.text = _user_rated ? widget.userData.Reviews[_user_review_index].Comments : '';
    _user_rating = _user_rated ? widget.userData.Reviews[_user_review_index].Score : -1;
    _user_review_time = _user_rated ? widget.userData.Reviews[_user_review_index].Time : _user_review_time;
    _user_favorite = widget.userData.Favorite.contains(widget.animeInfo.AnimeId);
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
            Column(children: [
              CarouselSlider(
                items: widget.animeInfo.LandScapes.map((fp) =>
                  imageCard(
                    'assets/images/${fp}',
                    width: MediaQuery.of(context).size.width-96,
                    height: MediaQuery.of(context).size.width*2/3-64,
                    fit: false
                  )
                ).toList(),
                carouselController: _image_controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _showing_image_index = index;
                      });
                    }),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.animeInfo.LandScapes.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _image_controller.animateToPage(entry.key),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      height: 8, width: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: _showing_image_index == entry.key ? Colors.blueGrey : null,
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 2,
                          ),
                        ),
                      ),
                  );}).toList(),
              ),
            ]),
            // SizedBox(height: 12,),

            // Author, Director
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12, bottom: 12, right: 4),
                  child: Text.rich(
                    TextSpan(
                      text: 'Author: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: widget.animeInfo.Author, style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12, bottom: 12),
                  child: Text.rich(
                    TextSpan(
                      text: 'Director: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: widget.animeInfo.Director, style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

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
                          if(_user_favorite){
                            widget.userData.Favorite.insert(0, widget.animeInfo.AnimeId);
                            widget.userData.Lists.singleWhere((list) => list.Title == "My favorite").Results.insert(0, widget.animeInfo);
                          }
                          else{
                            widget.userData.Favorite.remove(widget.animeInfo.AnimeId);
                            widget.userData.Lists.singleWhere((list) => list.Title == "My favorite").Results.remove(widget.animeInfo);
                          }
                        });
                      }
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: clickableBlockWithLabel(Icon(Icons.playlist_add_outlined), '', 
                      'Add to List', (){
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            return _listPopup(widget.userData);
                          },
                        );
                      }
                  ),
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
              height: 86,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: ['amazon.png', 'anigamer.png', 'disney.jpg', 'HBO.png', 'netflix.png'].map((fp) =>
                    Container(
                      padding: EdgeInsets.only(left: 12, right: 4),
                      child: imageCard('assets/images/${fp}', height: 86, width: 86),
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
              height: 136,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: widget.animeInfo.CastingInfos.map((mapping) =>
                    Container(
                      padding: EdgeInsets.only(left: 12, right: 4),
                      child: Column(
                        children: [
                          imageCard('assets/images/${mapping['img']}', height: 86, width: 86, radius: 59, fit: false),
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
                      imageCard('assets/images/person.jpg', height: 56, width: 56, radius: 28),
                      // rating star
                      Expanded(
                        child: Column(
                          children: [
                            RatingBar.builder(
                              ignoreGestures: _user_rated,
                              initialRating: (_user_rating != -1) ? _user_rating : 0,
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
                                  if(_user_review_index == -1){
                                    widget.userData.Reviews.add(
                                      Review(widget.animeInfo.AnimeId, _user_review_time, 0, _user_rating , _user_comment_controller.text)
                                    );
                                    _user_review_index = widget.userData.Reviews.length - 1;
                                  }
                                  else{
                                    widget.userData.Reviews[_user_review_index].Score = _user_rating;
                                  }
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
                      Text(formatter.format(_user_review_time), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(width: 4,),
                      clickableBlockWithLabel(Icon(Icons.edit,), '', '', (){setState(() {_user_rated = false;});},),
                      SizedBox(width: 4,),
                    ],
                  ) : ElevatedButton(
                    onPressed: _user_rating == -1 ? null : (){
                      setState(() {
                        _user_rated = true;
                        widget.userData.Reviews[_user_review_index].Comments = _user_comment_controller.text;
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
              children: widget.animeInfo.Comments.map((comment) => otherUserComment(widget.animeInfo, widget.animeList, widget.userData, widget.userList, comment)).toList(),
            ),
            SizedBox(height: 8),
          ],
        )
    );
  }
}
