import 'package:alca/model/categories.dart';
import 'package:alca/screen/LatestProductScreen.dart';
import 'package:alca/service/service.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder<List<FetchedCategories>>(
      future: RestApiManager().fetchcategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories endpoint'),
      ),
      body: futureBuilder,
      floatingActionButton: FloatingActionButton(
        child: Text('next'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LatestProductSCreen()),
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
        Text(snapshot.data[0].image)
      ],
    );
  }
}
