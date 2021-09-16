import 'package:alca/model/banner.dart';
import 'package:alca/screen/categorie_screen.dart';
import 'package:alca/service/service.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder<List<FetchedBan>>(
      future: RestApiManager().fetchBan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('loading...');
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("banner end point"),
      ),
      body: futureBuilder,
      floatingActionButton: FloatingActionButton(
        child: Text('next'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoriesScreen()),
          );
        },
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Text(snapshot.data[0].title),
      ],
    );
  }
}
