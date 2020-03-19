import 'dart:convert';

import 'package:duckcommunitynote/news/news_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatelessWidget {
  final dataProvider = DataProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: FutureBuilder(
          future: dataProvider.getDataFromHackerNews(),
          builder: (context, snapchot) {
            if(snapchot.hasData) {
              return ListView(
                children: <Widget>[NewsItem(snapchot.data)],
              );
            }
            return Text("tffehdd");
          },
        ));
  }
}

class DataProvider {
  final client = Client();

  Future<HackerNews> getDataFromHackerNews() async {
    var result = await client.get(
        'https://hacker-news.firebaseio.com/v0/item/121003.json?print=pretty');
    
    return Future.value(HackerNews.fromJson(JsonCodec().decode(result.body)));
  }
}

class HackerNews extends Equatable {
  String title;
  String description;
  String dataTime;

  HackerNews(this.title, this.description, this.dataTime);

  static HackerNews fromJson(dynamic object) {
    return HackerNews(object['title'], object['text'],
        DateFormat.yMMMd().format(new DateTime.now()));
  }

  @override
  List<Object> get props => [this.title, this.description, this.dataTime];
}
