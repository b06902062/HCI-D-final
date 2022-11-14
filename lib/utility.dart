import 'package:flutter/material.dart';

/*
  Overview
  animeCard (String imageSrc) { return anime cover }
  tagButton (String tagName, func) { return OutlineButton with text tagName and Onpressed func }
  sortButton (String sortName, func) { return ElevatedButton with text sortName and Onpressed func }
 */

Widget animeCard(String imageSrc) {
  return Container(
    height: 150,  // 155 = 150 animeCard height + 5 bottom margin
    width: 110,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Color.fromARGB(0, 244, 67, 54),
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
    child: OutlinedButton(
      style: TextButton.styleFrom(
        primary: Colors.teal.shade400,
        padding: EdgeInsets.all(0),
        side: BorderSide(color: Colors.teal.shade400, width: 2),
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