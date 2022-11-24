import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'utility.dart';

Widget follow(int follower, int following){
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

Widget editButton(){
  return SizedBox(
    height: 18,
    width: 150,
    child: ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(0),
        shape: StadiumBorder(),
      ),
      onPressed: (){},
      child: Text("Edit Personal Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    )
  );
}

Widget socialMedia(Social media){
  var iconMap = {"facebook": FontAwesomeIcons.facebook, "instagram": FontAwesomeIcons.instagram, "twitter": FontAwesomeIcons.twitter};
  return Container(
    alignment: Alignment.center,
    child: Row(
      children: [
        Icon(
          iconMap[media.Media], 
          color: Colors.blueGrey.shade200,
          size: 16
        ),
        SizedBox(width: 5),
        Text(
          media.Url,
          style: TextStyle( 
            fontSize: 12,
            color: Colors.blueGrey.shade300,
          )
        ),
        SizedBox(width: 5),
      ],
    ),
  );   
}

Widget infoBlock(PersonalInfo data) {
  return Container(
    color: Colors.blueGrey.shade800,
    padding: const EdgeInsets.all(12),
    height: 185,
    alignment: Alignment.centerLeft,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        //more icon
        Positioned(
          top: 8,
          right: 4,
          child: Icon(Icons.more_vert, color: Colors.blueGrey.shade100, size: 16),
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
                      editButton(),
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
              fontWeight: FontWeight.bold, 
              fontSize: 12,
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

Widget reviewSwitch(List<String> reviewInfo, func){
  return ToggleSwitch(
    minWidth: 80.0,
    minHeight: 18,
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
        reviewInfo.sort((b, a) => int.parse(a.split(',')[1]).compareTo(int.parse(b.split(',')[1])));
        print(reviewInfo);
        func();
      }
      else{
        reviewInfo.sort((b, a) => int.parse(a.split(',')[0]).compareTo(int.parse(b.split(',')[0])));
        print(reviewInfo);
        func();
      }
    },
  );
}

// Widget myReview(String data) {
//   //TODO: create class for comment data
//   return Container(
//     margin: EdgeInsets.only(top: 12, left: 16, right:16),
//     padding: EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(4),
//       color: Colors.blueGrey.shade50,
//     ),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // image
//         imageCard('assets/images/person.jpg', height: 72, width: 72, radius: 36),
//         SizedBox(width: 8,),
//         Expanded(
//           child: Column(
//             children: [
//               // Name, Title and Star
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(data['Name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                   // Text(data['Title'], style: TextStyle(fontWeight: FontWeight.bold, color: specialIndigo, fontSize: 16)),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: specialTeal, size: 20),
//                       Text(' ${data['Score']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                       Text('/10', style: TextStyle(fontSize: 16)),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4,),
//               // Comment
//               Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(4),
//                     color: Colors.white,
//                   ),
//                   child: Container(
//                     margin: EdgeInsets.all(6),
//                     child: Text(data['Comment'], style: TextStyle(fontSize: 12)),
//                   )
//               ),
//               SizedBox(height: 4,),
//               //TODO: discuss about the new design
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   // SizedBox(width: 0,),
//                   Row(
//                     children: [
//                       Icon(Icons.thumb_up_alt_outlined, size: 20),
//                       Text(' ${data['Likes']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.thumb_down_alt_outlined, size: 20),
//                       Text('  ${data['Likes']-100}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.reply, size: 20),
//                       Text(' reply', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                     ],
//                   ),
//                   // SizedBox(width: 0,),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     )
//   );
// }

class ReviewBlock extends StatefulWidget {
  final List<String> reviews;
  const ReviewBlock({required this.reviews});
  @override
  _ReviewBlock createState() => _ReviewBlock();
}

class _ReviewBlock extends State<ReviewBlock> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Column(
          children: 
            widget.reviews.map((review) => Column(
              children: [Container(
                  height: 166,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueGrey.shade100,
                  ),
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    review,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.bold
                    )
                  ),
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

Widget blockRow(String type, String title, List<String> filePaths) {
  ValueNotifier<bool> _notifier = ValueNotifier(false);
  if(type == "0"){
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey.shade100,
            fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Container(
        height: 120, // = imageCard height
        child: ListView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          children: 
            filePaths.map((fp) => Container(
              padding: EdgeInsets.only(left: 12),
              child: imageCard(fp, height: 120, width: 88),
              )
            ).toList(),
        ),
      ),
      SizedBox(height: 8),
    ]);
  }
  else{
    return Stack(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey.shade100,
                  fontWeight: FontWeight.bold
                )
              ),
              reviewSwitch(filePaths, () => _notifier.value = !_notifier.value),
            ],
          ),
          SizedBox(height: 8),
          ValueListenableBuilder<bool>(
            builder: (BuildContext context, bool value, Widget? child) {
              // This builder will only get called when the _counter
              // is updated.
              return ReviewBlock(reviews: filePaths);
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
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _blocks = [
    {
      'type': "0",
      'title': "| Favorite Anime 〉",
      'results': [
        "assets/images/anime3.png",
        "assets/images/anime2.png",
        "assets/images/anime1.png",
        "assets/images/anime5.png"
      ]
    },
    {
      'type': "0",
      'title': "| Search History 〉",
      'results': [
        "assets/images/anime3.png",
        "assets/images/anime4.png",
        "assets/images/anime6.png",
        "assets/images/anime7.png"
      ]
    },
    {
      'type': "1",
      'title': "| Reviews 〉",
      'results': [
        "20221123,10",
        "20221119,300",
        "20221120,100",
        "20221118,50"
      ]
    },
  ];

  var _personalInfo = PersonalInfo('User', 'person.jpg',
      'I love anime.\nAttack on Titan best anime.', 5, 10, 
      [
      Social('facebook', 'facebook.com/user'),
      Social('instagram', '@user'),
      Social('twitter', '@user'),
      ]
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          infoBlock(_personalInfo),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left:12, right: 12),
              children: _blocks.map(
                (block) => blockRow(block['type'] as String, block['title'] as String,block['results'] as List<String>)
              ).toList()
            )
          ),
        ]
      )
    );
  }
}
