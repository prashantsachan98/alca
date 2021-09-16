import 'package:alca/model/config.dart';
import 'package:alca/screen/LatestProductScreen.dart';
import 'package:alca/screen/banner.dart';
import 'package:alca/screen/categorie_screen.dart';
import 'package:alca/service/service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder<FetchedCon>(
      future: RestApiManager().fetchCon(),
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
        title: Text("config endpoint"),
      ),
      body: futureBuilder,
      floatingActionButton: FloatingActionButton(
        child: Text('next'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BannerScreen()),
          );
        },
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text(snapshot.data.aboutUs),
        ],
      ),
    );
  }
}
