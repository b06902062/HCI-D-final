import 'package:flutter/material.dart';
import 'animeProfile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

/*
  Class:
    - AnimeInfo(7 variables)
    - AnimeProfile(AnimeInfo animeInfo)

  Widgets:
    - imageCard (String imageSrc, height: 150, width: 110) { return anime cover in height 150 and border-radius 4 }
    - tagButton (String tagName, func) { return OutlineButton with text tagName and Onpressed func }
    - sortButton (String sortName, func) { return ElevatedButton with text sortName and Onpressed func }
    - clickableBlockWithLabel(Icon icon, String display, String label, func) { icon button with display(right) and label(below)}
    - recommendationRow(BuildContext context, String title, List<AnimeInfo> animes, { size: 'big' }) { return a row of anime cover with title }
    - animeBlock(AnimeInfo data, BuildContext context) { return a anime block in search page }
    - otherUserComment(data)

  Tricks:
    - MediaQuery.of(context).size.width - get the screen size
 */

Color specialTeal = Color.fromRGBO(0, 135, 136, 1);
Color specialIndigo = Color.fromRGBO(101, 115, 195, 1);

DateFormat formatter = DateFormat('yyyy-MM-dd');

// TODO: add rating/comment information
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

class Comment{
  String Name;
  DateTime Time;
  int Likes;
  double Score;
  String Comments;

  Comment(this.Name, this.Time, this.Likes, this.Score, this.Comments);
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

Widget tagButton(String tagName, func, {bool fill: false}) {
  return SizedBox(
    height: 24,
    width: tagName.length*8+9,  // TODO : find better solution
    child: OutlinedButton(
      style: TextButton.styleFrom(
        primary: specialTeal,
        padding: EdgeInsets.all(0),
        side: BorderSide(color: specialTeal, width: 2),
        shape: StadiumBorder(),
        backgroundColor: fill ? Colors.blueGrey.shade100 : Color.fromARGB(0, 207, 216, 220)
      ),
      onPressed: func,
      child: Text(tagName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    ),
  );
}

Widget sortButton(String sortName, func) {
  return SizedBox(
      height: 24,
      width: sortName.length*8+9,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(0),
          shape: StadiumBorder(),
        ),
        onPressed: func,
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
            display.isEmpty? Container() : Text(display),
          ],
        ),
        label.isEmpty? Container() : Text(label),
      ],
    ),
  );
}

Widget recommendationRow(BuildContext context, String title, List<AnimeInfo> animes, { size: 'big' }) {
  double _fontSize = size == 'big'? 22 : 16;
  double _padding_between = size == 'big'? 12 : 8;
  double _height = size == 'big'? 150 : 120;
  double _width = size == 'big'? 110 : 88;
  double _padding_bottom = size == 'big'? 16: 12;

  return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('| ${title} 〉', style: TextStyle(fontSize: _fontSize, color: Colors.blueGrey.shade100, fontWeight: FontWeight.bold)),
        SizedBox(height: _padding_between),
        Container(
          height: _height,
          child: ListView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            children: animes.map((anime) =>
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new AnimeProfile(animeInfo: anime)),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: imageCard('assets/images/${anime.Cover}', height: _height, width: _width),
                    )
                )
            ).toList(),
          ),
        ),
        SizedBox(height: _padding_bottom,),
      ]
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
      margin: EdgeInsets.only(left: 16, right: 16),
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
                  margin: EdgeInsets.all(6),
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
                Icon(Icons.star, color: specialTeal, size: 20),
                Text(' ${data.Score}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget otherUserComment(Comment comment) {
  return Container(
    margin: EdgeInsets.only(top: 12, left: 16, right:16),
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
        imageCard('assets/images/person.jpg', height: 72, width: 72, radius: 36),
        SizedBox(width: 8,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name, Title and Star
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(comment.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
                  Row(
                    children: [
                      Icon(Icons.star, color: specialTeal, size: 20),
                      Text(' ${(comment.Score == comment.Score.toInt() ? comment.Score.toInt() : comment.Score)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('/5', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              Text(formatter.format(comment.Time), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(height: 4,),
              // Comment
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Text(comment.Comments, style: TextStyle(fontSize: 12)),
                )
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined, size: 20),
                      Text(' ${comment.Likes}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.reply, size: 20),
                      Text(' reply', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    )
  );
}

//Personal Profile
/*
  Class:
    - Social(2 variables)
    - PersonalInfo(6 variables)
    - FavoriteAndHistory(2 variables)
    - Review(5 variables)

  Widgets:
    - follow(int follower, int following) { return number of the follower and followings }
    - editButton() { return a button used to edit personal profile }
    - socialMedia(Social media) { return the social medias in personal information }
    - infoBlock(PersonalInfo data) { return the top personal information }
    - reviewSwitch(List<Review> reviews, func) { return a toggleswitch that sorts the reviews by Popularity/Time }
    - ReviewList({required this.reviews}) { return columns of reviews }
    - reviewRow(List<Review> reviews, { size: 'big' }) { return columns of reviews with title and switch }

  Tricks:
    - ValueListenableBuilder: update a widget only instead of the whole page

 */

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

class FavoriteAndHistory {
  String Title;
  List<AnimeInfo> Results;

  FavoriteAndHistory(this.Title, this.Results);
}

class Review{
  AnimeInfo anime;
  DateTime Time;
  int Likes;
  double Score;
  String Comments;
  bool Edit;

  Review(this.anime, this.Time, this.Likes, this.Score, this.Comments, this.Edit);
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

Widget editButton(BuildContext context){
  // TODO: edit personal profile
  return SizedBox(
    height: 18,
    width: 150,
    child: ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(0),
        shape: StadiumBorder(),
      ),
      onPressed: (){
        showDialog(
          context: context, 
          barrierColor: Colors.black54,
          barrierDismissible: true,
          barrierLabel: 'Label',
          builder: (BuildContext context) {
            return LoginPopup();
          },
        );
      },
      child: Text("Edit Personal Profile", style: TextStyle(fontSize: 14)),
    )
  );
}

Widget socialMedia(Social media){
  // TODO: hyperlink
  var iconMap = {"facebook": FontAwesomeIcons.facebook, "instagram": FontAwesomeIcons.instagram, "twitter": FontAwesomeIcons.twitter};
  var link = {"facebook": "https://www.facebook.com/", "instagram": "https://www.instagram.com/", "twitter": "https://twitter.com/"};
  return InkWell(
    onTap: () {
      launchUrl(Uri.parse(link[media.Media]! + media.Url.split('@')[media.Url.split('@').length - 1]));
    },
    child: Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(
            iconMap[media.Media], 
            color: Colors.blueGrey.shade200,
            size: 20
          ),
          SizedBox(width: 5),
          Text(
            media.Url,
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

Widget infoBlock(PersonalInfo data, BuildContext context) {
  // TODO: more button
  return Container(
    color: Colors.blueGrey.shade800,
    padding: const EdgeInsets.all(12),
    height: 200,
    alignment: Alignment.centerLeft,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        //more icon
        Positioned(
          top: 8,
          right: 0,
          child: Icon(Icons.more_vert, color: Colors.blueGrey.shade100, size: 20),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // title
          Text(
            data.Name,
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 24,
              color: Colors.blueGrey.shade100,
            )
          ),
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
                      editButton(context),
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
              children: data.Media.map(
                (media) => socialMedia(media)
              ).toList()
            )
          )
        ]),
      ],)
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
  final List<Review> reviews;
  const ReviewList({required this.reviews});
  @override
  _ReviewList createState() => _ReviewList();
}

class _ReviewList extends State<ReviewList> {
  // TODO: edit button
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Column(
          children: 
            widget.reviews.map((review) => 
            review.Edit ?
            Column(
              children: [
                Container(
                  height: 180,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueGrey.shade50,
                  ),
                  child:Container(
                    height: 20,
                    width: 20,
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          review.Edit = false;
                        });
                      },
                      padding: EdgeInsets.zero,
                      iconSize: 20,
                      icon: Icon(Icons.send, color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => new AnimeProfile(animeInfo: review.anime)),
                            );
                          },
                          child: Container(
                            child: imageCard('assets/images/${review.anime.Cover}', height: 120, width: 88),
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
                              children: [
                                Text(review.anime.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: specialTeal, size: 20),
                                    Text((review.Score == review.Score.toInt() ? review.Score.toInt() : review.Score).toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text('/5', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            //Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatter.format(review.Time), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 14)),
                                // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
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
                              ],
                            ),
                            SizedBox(height: 4,),
                            // Comment
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(6),
                                  child: Text(review.Comments, style: TextStyle(fontSize: 12)),
                                )
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.thumb_up_alt_outlined, color: Colors.blueGrey, size: 16),
                                    Text(" " + review.Likes.toString(), style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 16)),
                                  ],
                                )
                                // SizedBox(width: 0,),
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

Widget reviewRow(List<Review> reviews, { size: 'big' }) {
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
            reviewSwitch(reviews, () => _notifier.value = !_notifier.value),
          ],
        ),
        SizedBox(height: 10),
        ValueListenableBuilder<bool>(
          builder: (BuildContext context, bool value, Widget? child) {
            // This builder will only get called when the _counter
            // is updated.
            return ReviewList(reviews: reviews);
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