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

Widget reviewSwitch(List<String>reviewInfo){
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
        reviewInfo.sort((b, a) => a.split(',')[1].compareTo(b.split(',')[1]));
        print(reviewInfo);
      }
      else{
        reviewInfo.sort((b, a) => a.split(',')[0].compareTo(b.split(',')[0]));
        print(reviewInfo);
      }
    },
  );
}

Widget blockRow(String type, String title, List<String> filePaths) {
  if(type == "0"){
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
            fontSize: 14,
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
        Positioned(
          top: 2,
          right: 4,
          child: reviewSwitch(filePaths),
        ),
        Positioned(
          top: 30,
          right: 4,
          child: ElevatedButton(
            child: Text('refresh'),
            onPressed: (){
              print(filePaths);
            },
          )
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey.shade100,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 8),
          Column(
            children: 
              filePaths.map((fp) => Column(
                children: [Container(
                    height: 166,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blueGrey.shade100,
                    ),
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      fp,
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
        "20221120,100",
        "20221119,300",
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
              padding: const EdgeInsets.only(left:12),
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
