import 'package:duckcommunitynote/news/news_page.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  HackerNews hackerNews;

  NewsItem(this.hackerNews);
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text('Tytuł'),
            SizedBox(height: 10,),
            Text('Opis')
          ],),
          Text(this.hackerNews.dataTime)
      ],),),
    );
  }
}