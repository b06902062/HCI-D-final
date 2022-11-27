import 'package:flutter/material.dart';
import 'animeProfile.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utility.dart';
import 'lists.dart';
import 'database.dart';

/*
  Class:
    - PersonalInfo(8 variables)
    - FavoriteAndHistory(2 variables)
    - Review(7 variables)
    - EditPopupController(3 variables)

  Widgets:
    - follow(int follower, int following) { return number of the follower and followings }
    - LoginPopup() {return an unused login popup}
    - EditPopup({required this.personalInfo, required this.notifier}) { return an edit popup to edit user profile }
    - editButton(BuildContext context, PersonalInfo data, ValueNotifier<bool> _notifier) { return a button used to edit personal profile }
    - followButton(BuildContext context, PersonalInfo data, ValueNotifier<bool> _notifier) { return follow button for other users }
    - socialMedia(String media) { return the social medias in personal information }
    - infoBlockListener(PersonalInfo data, BuildContext context, bool isUser) { return infoblock(used to refresh infoblock) }
    - infoBlock(PersonalInfo data, BuildContext context, ValueNotifier<bool> _notifier, bool isUser) { return the top personal information }
    - reviewSwitch(List<Review> reviews, func) { return a toggleswitch that sorts the reviews by Popularity/Time }
    - ReviewList({required this.reviews, required this.isUser}) { return columns of reviews }
    - reviewRow(List<Review> reviews, bool isUser, { size: 'big' }) { return columns of reviews with title and switch }


  Tricks:
    - ValueListenableBuilder: update a widget only instead of the whole page

 */

class PersonalInfo{
  int UserId;
  String Name;
  String Photo;
  int Follower;
  int Following;
  String Description;
  String Facebook;
  String Instagram;
  String Twitter;
  List<int> Favorite;
  List<UserList> Lists;
  List<int> SearchHistory;
  List<Review> Reviews; 

  PersonalInfo(this.UserId, this.Name, this.Photo, this.Follower, this.Following, this.Description, this.Facebook, this.Instagram, this.Twitter, this.Favorite, this.Lists, this.SearchHistory, this.Reviews);
}

class FavoriteAndHistory {
  String Title;
  List<AnimeInfo> Results;

  FavoriteAndHistory(this.Title, this.Results);
}

class Review{
  int AnimeId;
  DateTime Time;
  int Likes;
  double Score;
  String Comments;
  bool Liked = false;
  bool Edit = false;
  TextEditingController EditController = TextEditingController();

  Review(this.AnimeId, this.Time, this.Likes, this.Score, this.Comments, [this.Liked = false, this.Edit = false]);
}

class EditPopupController{
  String type;
  TextEditingController controller;
  String hint;

  EditPopupController(this.type, this.controller, this.hint);
}

Widget follow(int follower, int following){
  // TODO: show followings & followers
  return Row(
    children:[
      Text(
        follower.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 14,
          color: Colors.blueGrey.shade100,
        )
      ),
      SizedBox(width: 3),
      Text(
        "followers",
        style: TextStyle( 
          fontSize: 14,
          color: Colors.blueGrey.shade300,
        )
      ),
      SizedBox(width: 5),
      Text(
        following.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 14,
          color: Colors.blueGrey.shade100,
        )
      ),
      SizedBox(width: 3),
      Text(
        "following",
        style: TextStyle( 
          fontSize: 14,
          color: Colors.blueGrey.shade300,
        )
      ),              
    ]
  );
}

class LoginPopup extends StatefulWidget{

  @override
  _LoginPopup createState() => _LoginPopup();
}

class _LoginPopup extends State<LoginPopup> {
  final TextEditingController _user_name_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.blueGrey.shade900,
          ),
          child: Column(
            children: [
              Text(
                "AniRate",
                style: TextStyle(
                  fontFamily: 'Charm',
                  fontWeight: FontWeight.bold, 
                  fontSize: 72,
                  color: Colors.blueGrey.shade100,
                )
              ),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.generalLogin,
                onPressed: () {},
              ),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.apple,
                onPressed: () {},
              )
            ],
          )
        )
      ),
    );
  }
}

class EditPopup extends StatefulWidget{
  final PersonalInfo personalInfo;
  final ValueNotifier<bool> notifier;
  const EditPopup({required this.personalInfo, required this.notifier});

  @override
  _EditPopup createState() => _EditPopup();
}

class _EditPopup extends State<EditPopup> {
  EditPopupController _user_name_controller = EditPopupController("User Name", new TextEditingController(), "user");
  EditPopupController _user_photo_controller = EditPopupController("User Photo", new TextEditingController(), "person.png");
  EditPopupController _user_description_controller = EditPopupController("Description", new TextEditingController(), "description(max length: 90))");
  EditPopupController _user_facebook_controller = EditPopupController("Facebook Username", new TextEditingController(), "facebook");
  EditPopupController _user_instagram_controller = EditPopupController("Instagram Username", new TextEditingController(), "@instagram");
  EditPopupController _user_twitter_controller = EditPopupController("Twitter Username", new TextEditingController(), "@twitter");
  List<EditPopupController> _controllers = [];

  @override void initState() {
    super.initState();
    _controllers.addAll([_user_name_controller, _user_photo_controller, _user_description_controller, _user_facebook_controller, _user_instagram_controller, _user_twitter_controller]);
    _user_name_controller.controller.text = widget.personalInfo.Name;
    _user_photo_controller.controller.text = widget.personalInfo.Photo;
    _user_description_controller.controller.text = widget.personalInfo.Description;
    _user_facebook_controller.controller.text = widget.personalInfo.Facebook;
    _user_instagram_controller.controller.text = widget.personalInfo.Instagram;
    _user_twitter_controller.controller.text = widget.personalInfo.Twitter;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.blueGrey.shade900,
      title: Text("User Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _controllers.map((controller)=>
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 4),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              style: TextStyle(color: Colors.blueGrey.shade100),
              // keyboardType: TextInputType.multiline,
              maxLines: controller.type == "Description"? null:1,
              maxLength: controller.type == "Description"? 90:null,
              controller: controller.controller,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: controller.type,
                labelStyle: TextStyle(color: Colors.blueGrey.shade400),
                hintText: controller.hint,
                hintStyle: TextStyle(color: Colors.blueGrey.shade400),
              ),
            ),
          )
        ).toList(),
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
          onPressed: (){
            widget.notifier.value = !widget.notifier.value;
            widget.personalInfo.Name = _user_name_controller.controller.text;
            widget.personalInfo.Photo = _user_photo_controller.controller.text;
            widget.personalInfo.Description = _user_description_controller.controller.text;
            widget.personalInfo.Facebook = _user_facebook_controller.controller.text;
            widget.personalInfo.Instagram = _user_instagram_controller.controller.text;
            widget.personalInfo.Twitter = _user_twitter_controller.controller.text;
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.check, color: Colors.green), 
          label: Text("OK", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey.shade100,))
        ),
      ],
    );
  }
}

Widget editButton(BuildContext context, PersonalInfo data, ValueNotifier<bool> _notifier){
  return SizedBox(
    height: 18,
    width: 168,
    child: ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(0),
        shape: StadiumBorder(),
      ),
      onPressed: (){
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return EditPopup(personalInfo: data, notifier: _notifier);
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Edit Personal Profile", style: TextStyle(fontSize: 14)), 
          SizedBox(width: 5,),
          Icon(Icons.edit, size: 16),
        ],
      ),
    ),
  );
}

Widget followButton(BuildContext context, PersonalInfo data, ValueNotifier<bool> _notifier){
  //follow
  return SizedBox(
    height: 18,
    width: 50,
    child: ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(0),
        shape: StadiumBorder(),
      ),
      onPressed: (){

      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("follow", style: TextStyle(fontSize: 14)), 
        ],
      ),
    ),
  );
}

Widget socialMedia(String media){
  String _media = media.split(',')[0];
  String _url = media.split(',')[1];
  var iconMap = {"facebook": FontAwesomeIcons.facebook, "instagram": FontAwesomeIcons.instagram, "twitter": FontAwesomeIcons.twitter};
  var link = {"facebook": "https://www.facebook.com/", "instagram": "https://www.instagram.com/", "twitter": "https://twitter.com/"};
  return _url.isEmpty?
  Container():
  InkWell(
    onTap: () {
      launchUrl(Uri.parse("${link[_media]!}${_url.split('@')[_url.split('@').length - 1]}"));
    },
    child: Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(
            iconMap[_media], 
            color: Colors.blueGrey.shade200,
            size: 20
          ),
          SizedBox(width: 5),
          Text(
            _url,
            style: TextStyle( 
              fontSize: 14,
              color: Colors.blueGrey.shade300,
            )
          ),
          SizedBox(width: 5),
        ],
      ),
    )
  ); 
}

Widget infoBlockListener(PersonalInfo data, BuildContext context, bool isUser){
  ValueNotifier<bool> _notifier = ValueNotifier(false);
  return ValueListenableBuilder<bool>(
    builder: (BuildContext context, bool value, Widget? child) {
      // This builder will only get called when the _counter
      // is updated.
      return infoBlock(data, context, _notifier, isUser);
    },
    valueListenable: _notifier,
    // The child parameter is most helpful if the child is
    // expensive to build and does not depend on the value from
    // the notifier.
  );
}

Widget infoBlock(PersonalInfo data, BuildContext context, ValueNotifier<bool> _notifier, bool isUser) {
  List<String> medias = [];
  medias.addAll(["facebook,${data.Facebook}", "instagram,${data.Instagram}" , "twitter,${data.Twitter}"]);

  // TODO: more button
  return Container(
    color: Colors.blueGrey.shade800,
    padding: const EdgeInsets.all(12),
    height: isUser? 200: 160,
    alignment: Alignment.centerLeft,
    child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          isUser?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.Name,
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 24,
                  color: Colors.blueGrey.shade100,
                )
              ),
            ],
          )
          : Container() 
          ,
          //user photo, follow, edit button
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // user photo
                Container(
                  height: 72,
                  child: imageCard('assets/images/${data.Photo}',
                      height: 72, width: 72, radius: 36),
                ),
                SizedBox(width: 10),
                //follow, edit button
                Container(
                  height: 72,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //follow
                      follow(data.Follower, data.Following),
                      SizedBox(height:10),
                      //edit button
                      isUser? editButton(context, data, _notifier): followButton(context, data, _notifier),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          // description
          Text(
            data.Description,
            style: TextStyle(
              // fontWeight: FontWeight.bold, 
              fontSize: 14,
              color: Colors.blueGrey.shade200,
            )
          ),
          SizedBox(height: 5),
          // social media
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: medias.map(
                (media) => socialMedia(media)
              ).toList()
            )
          )
        ]
      ),
  );
}

Widget reviewSwitch(List<Review> reviews, func){
  return ToggleSwitch(
    minWidth: 80.0,
    minHeight: 24,
    initialLabelIndex: 0,
    cornerRadius: 20.0,
    activeFgColor: Colors.blueGrey.shade100,
    inactiveBgColor: Colors.blueGrey.shade700,
    inactiveFgColor: Colors.blueGrey.shade100,
    totalSwitches: 2,
    labels: ['Popular', 'Recent'],
    customTextStyles: [
      TextStyle(
        fontSize: 14,
        color: Colors.blueGrey.shade100,
      ),
      TextStyle(
        fontSize: 14,
        color: Colors.blueGrey.shade100,
      )
    ],
    activeBgColors: [[Colors.teal],[Colors.teal]],
    onToggle: (index) {
      if(index == 0){
        reviews.sort((b, a) => a.Likes.compareTo(b.Likes));
        func();
      }
      else{
        reviews.sort((b, a) => a.Time.compareTo(b.Time));
        func();
      }
    },
  );
}

class ReviewList extends StatefulWidget {
  final List<AnimeInfo> animeList;
  final PersonalInfo userData;
  final List<PersonalInfo> userList;
  final bool isUser;
  final int id;
  const ReviewList({required this.animeList, required this.userData, required this.userList, required this.isUser, required this.id});
  @override
  _ReviewList createState() => _ReviewList();
}

class _ReviewList extends State<ReviewList> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  

  @override void initState() {
    super.initState();
    for(int i = 0; i < widget.userData.Reviews.length; i++){
      widget.userData.Reviews[i].EditController.text = widget.userData.Reviews[i].Comments;
    }
    for(int i = 0; i < widget.userList[widget.id].Reviews.length; i++){
      widget.userList[widget.id].Reviews[i].EditController.text = widget.userList[widget.id].Reviews[i].Comments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Column(
          children: 
            (widget.isUser?widget.userData:widget.userList[widget.id]).Reviews.map((review) => 
            review.Edit ?
            Column(
              children:[
                Container(
                  // margin: EdgeInsets.only(left: 16, right: 16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueGrey.shade50,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 8,),
                          imageCard('assets/images/${widget.animeList[review.AnimeId].Cover}', height: 120, width: 88),
                          // rating star
                          Expanded(
                            child: Column(
                              children: [
                                RatingBar.builder(
                                  initialRating: review.Score,
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
                                      review.Score = rating;
                                    });
                                  },
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 4),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          controller: review.EditController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Leave your comment and rating',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  review.Comments = review.EditController.text;
                                  review.Edit = false;
                                  review.Time = DateTime.now().toUtc();
                                });
                              },
                              padding: EdgeInsets.zero,
                              iconSize: 20,
                              icon: Icon(Icons.send, color: Colors.blueGrey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              ]
            )
            : 
            Column(
              children: [Container(
                  // margin: EdgeInsets.only(top: 12, left: 16, right:16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueGrey.shade50,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // image
                      GestureDetector(
                          onTap: () {
                            if(widget.userData.SearchHistory.contains(review.AnimeId)){
                              widget.userData.SearchHistory.remove(review.AnimeId);
                              widget.userData.SearchHistory.insert(0, review.AnimeId);
                            }
                            else{
                              widget.userData.SearchHistory.removeLast();
                              widget.userData.SearchHistory.insert(0, review.AnimeId);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => new AnimeProfile(animeInfo: widget.animeList[review.AnimeId],  animeList: widget.animeList, userData: widget.userData, userList: widget.userList)),
                            );
                          },
                          child: Container(
                            child: imageCard('assets/images/${widget.animeList[review.AnimeId].Cover}', height: 120, width: 88),
                          )
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name, Title and Star
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 200,
                                  child: Text(widget.animeList[review.AnimeId].Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis,),
                                ),
                                // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
                                review.Comments.isEmpty?
                                Container():
                                Row(
                                  children: [
                                    Icon(Icons.star, color: specialTeal, size: 20),
                                    Text(review.Score.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text('/5', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4,),
                            // Comment
                            review.Comments.isEmpty?
                            Column(
                              children: [
                                SizedBox(height: 15,),
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: review.Score,
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
                                    });
                                  },
                                ),
                                SizedBox(height: 15,),
                              ]
                            )
                            :
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(6),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(review.Comments, style: TextStyle(fontSize: 12)),
                                  )
                                )
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.thumb_up_alt_outlined, color: Colors.blueGrey, size: 16),
                                    Text(" ${review.Likes}", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16)),
                                  ]
                                ),
                                //Date & edit button
                                Row(
                                  children: [
                                    Text(formatter.format(review.Time), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14)),
                                    // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
                                    widget.isUser?
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            review.Edit = true;
                                          });
                                        },
                                        padding: EdgeInsets.zero,
                                        iconSize: 20,
                                        icon: Icon(Icons.edit, color: Colors.blueGrey),
                                      ),
                                    )
                                    : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(height: 10,)
              ]
            )
          ).toList(),
        ),
      ]
    );
  }   
}

Widget reviewRow(List<AnimeInfo> animeList, PersonalInfo userData, List<PersonalInfo> userList, bool isUser, { size: 'big' , int id: 0}) {
  double _fontSize = size == 'big'? 22 : 16;
  double _padding_between = size == 'big'? 12 : 8;
  double _height = size == 'big'? 150 : 120;
  double _width = size == 'big'? 110 : 88;
  double _padding_bottom = size == 'big'? 16: 12;

  ValueNotifier<bool> _notifier = ValueNotifier(false);
  return Stack(
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('| Review 〉', style: TextStyle(fontSize: _fontSize, color: Colors.blueGrey.shade100, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            reviewSwitch(isUser? userData.Reviews: userList[id].Reviews, () => _notifier.value = !_notifier.value),
          ],
        ),
        SizedBox(height: 10),
        ValueListenableBuilder<bool>(
          builder: (BuildContext context, bool value, Widget? child) {
            // This builder will only get called when the _counter
            // is updated.
            return ReviewList(animeList: animeList, userData: userData, userList: userList, isUser: isUser, id: id);
          },
          valueListenable: _notifier,
          // The child parameter is most helpful if the child is
          // expensive to build and does not depend on the value from
          // the notifier.
        )
      ])
    ]
  );
}