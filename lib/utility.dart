import 'package:AniRate/otherUserProfile.dart';
import 'package:flutter/material.dart';
import 'animeProfile.dart';
import 'package:intl/intl.dart';
import 'profileUtility.dart';

/*
  Class:
    - AnimeInfo(7 variables)
    - AnimeProfile(AnimeInfo animeInfo)

  Widgets:
    - imageCard (String imageSrc, height: 150, width: 110) { return anime cover in height 150 and border-radius 4 }
    - tagButton (String tagName, func) { return OutlineButton with text tagName and Onpressed func }
    - sortButton (String sortName, func) { return ElevatedButton with text sortName and Onpressed func }
    - clickableBlockWithLabel(Icon icon, String display, String label, func) { icon button with display(right) and label(below)}
    - bracketTitle(String title, double fontSize) { return a title like '|title>'}
    - recommendationRow(BuildContext context, Widge title, List<AnimeInfo> animes, { size: 'big' }) { return a row of anime cover with title }
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
  final int AnimeId;
  final String Name;
  final String Author;
  final String Director;
  final List<Map<String, String>> CastingInfos;
  // key string：name role img
  // Format： img = Cover +C1, C2, ...
  final List<String> Tags;
  //action, adventure, comedy, monster, school, family. fantasy, drama, supernatural, gag humor, sci-fi, sports,
  final String Cover;
  final List<String> LandScapes;
  // Format：LandScape = Cover +00, 01, ...
  final double Score;
  final String Description;
  final List<int> YMD;
  final int Favorites;
  final List<Comment> Comments;

  AnimeInfo(
    this.AnimeId,
    this.Name,
    this.Author,
    this.Director,
    this.CastingInfos,
    this.Tags,
    this.Cover,
    this.LandScapes,
    this.Score,
    this.Description,
    this.YMD,
    this.Favorites,
    this.Comments,
  );
}

class Comment {
  int UserId;
  DateTime Time;
  int Likes;
  double Score;
  String Comments;
  bool Liked;

  Comment(this.UserId, this.Time, this.Likes, this.Score, this.Comments,
      [this.Liked = false]);
}

Widget imageCard(String imageSrc,
    {double height: 150, double width: 110, double radius: 4, bool fit: true}) {
  return Container(
    height: height,
    width: width,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
    ),
    child: Image.asset(
      imageSrc,
      fit: fit ? BoxFit.fill : BoxFit.cover,
    ),
  );
}

Widget tagButton(String tagName, func, {bool fill: false}) {
  return SizedBox(
    height: 24,
    width: tagName.length * 8 + 9, // TODO : find better solution
    child: OutlinedButton(
      style: TextButton.styleFrom(
          primary: specialTeal,
          padding: EdgeInsets.all(0),
          side: BorderSide(color: specialTeal, width: 2),
          shape: StadiumBorder(),
          backgroundColor: fill
              ? Colors.blueGrey.shade100
              : Color.fromARGB(0, 207, 216, 220)),
      onPressed: func,
      child: Text(tagName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    ),
  );
}

Widget sortButton(String sortName, func) {
  return SizedBox(
      height: 24,
      width: sortName.length * 8 + 9,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(0),
          shape: StadiumBorder(),
        ),
        onPressed: func,
        child: Text(sortName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ));
}

Widget clickableBlockWithLabel(Icon icon, String display, String label, func) {
  return GestureDetector(
    onTap: func,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            display.isEmpty ? Container() : Text(display),
          ],
        ),
        label.isEmpty ? Container() : Text(label),
      ],
    ),
  );
}

Widget bracketTitle(String title, double fontSize) {
  return Text('| ${title} 〉',
      style: TextStyle(
          fontSize: fontSize,
          color: Colors.blueGrey.shade100,
          fontWeight: FontWeight.bold));
}

Widget recommendationRow(
    BuildContext context,
    Widget Title,
    List<AnimeInfo> animes,
    List<AnimeInfo> animeList,
    final PersonalInfo userData,
    final List<PersonalInfo> userList,
    {size: 'big'}) {
  double _padding_between = size == 'big' ? 12 : 8;
  double _height = size == 'big' ? 150 : 120;
  double _width = size == 'big' ? 110 : 88;
  double _padding_bottom = size == 'big' ? 16 : 12;

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Title,
    SizedBox(height: _padding_between),
    Container(
      height: _height,
      child: ListView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: animes
            .map((anime) => GestureDetector(
                onTap: () {
                  userData.SearchHistory.removeLast();
                  userData.SearchHistory.insert(0, anime.AnimeId);
                  // print(widget.userData.SearchHistory);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new AnimeProfile(
                              animeInfo: anime,
                              animeList: animeList,
                              userData: userData,
                              userList: userList,
                            )),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: imageCard('assets/images/${anime.Cover}',
                      height: _height, width: _width),
                )))
            .toList(),
      ),
    ),
    SizedBox(
      height: _padding_bottom,
    ),
  ]);
}

Widget animeBlock(
    AnimeInfo data,
    List<AnimeInfo> animeList,
    final PersonalInfo userData,
    final List<PersonalInfo> userList,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new AnimeProfile(
                  animeInfo: data,
                  animeList: animeList,
                  userData: userData,
                  userList: userList,
                )),
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
                    color: Colors.blueGrey.shade50),
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Text(data.Description, style: TextStyle(fontSize: 12)),
                )),
          ),
          // information
          Positioned(
              left: 126,
              top: 8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.Name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    // SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        text: 'Author: ',
                        style: TextStyle(fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                              text: data.Author,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Director: ',
                        style: TextStyle(fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                              text: data.Director,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      children: (data.Tags as List)
                          .map((name) => tagButton(name, () {}))
                          .toList(),
                    ),
                  ])),
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
                Text(' ${data.Score}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget otherUserComment(AnimeInfo animeInfo, List<AnimeInfo> animeList,
    PersonalInfo userData, List<PersonalInfo> userList, Comment comment) {
  ValueNotifier<bool> notifier = ValueNotifier(comment.Liked);
  return ValueListenableBuilder<bool>(
    builder: (BuildContext context, bool value, Widget? child) {
      return Container(
          margin: EdgeInsets.only(top: 12, left: 16, right: 16),
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
                      MaterialPageRoute(
                          builder: (context) => OtherUserProfile(
                              animeList: animeList,
                              userData: userData,
                              userList: userList,
                              id: comment.UserId)),
                    );
                  },
                  child: Container(
                    child: imageCard('assets/images/person.jpg',
                        height: 72, width: 72, radius: 36),
                  )),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name, Title and Star
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userList[comment.UserId].Name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
                        Row(
                          children: [
                            Icon(Icons.star, color: specialTeal, size: 20),
                            Text(' ${comment.Score}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('/5', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                    Text(formatter.format(comment.Time),
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    SizedBox(
                      height: 4,
                    ),
                    // Comment
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(6),
                          child: Text(comment.Comments,
                              style: TextStyle(fontSize: 12)),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            clickableBlockWithLabel(
                                comment.Liked
                                    ? Icon(Icons.thumb_up,
                                        color: specialIndigo, size: 20)
                                    : Icon(Icons.thumb_up_alt_outlined,
                                        size: 20),
                                '',
                                '', () {
                              comment.Liked = !comment.Liked;
                              comment.Likes = comment.Liked
                                  ? comment.Likes + 1
                                  : comment.Likes - 1;
                              var userReviewindex = userList[comment.UserId]
                                  .Reviews
                                  .indexWhere((review) =>
                                      review.AnimeId == animeInfo.AnimeId);
                              userList[comment.UserId]
                                      .Reviews[userReviewindex]
                                      .Likes =
                                  comment.Liked
                                      ? userList[comment.UserId]
                                              .Reviews[userReviewindex]
                                              .Likes +
                                          1
                                      : userList[comment.UserId]
                                              .Reviews[userReviewindex]
                                              .Likes -
                                          1;
                              notifier.value = !notifier.value;
                            }),
                            Text(' ${comment.Likes}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.reply, size: 20),
                            Text(' reply',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ));
    },
    valueListenable: notifier,
  );
}
