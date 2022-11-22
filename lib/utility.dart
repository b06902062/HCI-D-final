import 'package:flutter/material.dart';
import 'animeProfile.dart';

/*
  Class:
    - AnimeInfo(7 variables)
    - AnimeProfile(AnimeInfo animeInfo)

  Widgets:
    - imageCard (String imageSrc, height: 150, width: 110) { return anime cover in height 150 and border-radius 4 }
    - tagButton (String tagName, func) { return OutlineButton with text tagName and Onpressed func }
    - sortButton (String sortName, func) { return ElevatedButton with text sortName and Onpressed func }
    - clickableBlockWithLabel(Icon icon, String display, String label, func) { icon button with display(right) and label(below)}
    - animeBlock(AnimeInfo data, BuildContext context) { return a anime block in search page }

  Tricks:
    - MediaQuery.of(context).size.width - get the screen size
 */

Color specialTeal = Color.fromRGBO(0, 135, 136, 1);
Color specialIndigo = Color.fromRGBO(101, 115, 195, 1);

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
    width: tagName.length*8+9,
    child: OutlinedButton(
      style: TextButton.styleFrom(
        primary: specialTeal,
        padding: EdgeInsets.all(0),
        side: BorderSide(color: specialTeal, width: 2),
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
