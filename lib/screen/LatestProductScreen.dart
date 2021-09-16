import 'package:alca/model/LatestProdcuts.dart';
import 'package:alca/service/service.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LatestProductSCreen extends StatefulWidget {
  @override
  _LatestProductSCreenState createState() => _LatestProductSCreenState();
}

class _LatestProductSCreenState extends State<LatestProductSCreen> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder<FetchedLatestProducts>(
      future: RestApiManager().fetchedLatestProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('loading...');
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
        title: Text("Latest product"),
      ),
      body: futureBuilder,
      floatingActionButton: FloatingActionButton(
        child: Text('next'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
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
        Text(snapshot.data.totalSize.toString())
      ],
    );
  }
}
