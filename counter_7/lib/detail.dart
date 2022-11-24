import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/mywatchlist.dart';

class watchlistdetail extends StatefulWidget {
  const watchlistdetail({ super.key, required this.watched, required this.title, required this.rating, required this.date, required this.review});
  final Watched watched;
  final String title;
  final int rating;
  final String date;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Watchlist detail')),
        drawer: drawer(),
         body: Column(
        children: [
          Align(
            alignment: Alignment.center, child: Text(watched ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35)),
          ),
          ListTile(
            leading: Text('Release Date :', style: TextStyle(fontWeight: FontWeight.bold)),
            title: Text(title),
          ),
          ListTile(
            leading: Text('Rating :', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(''),
            title: Text(rating),
          ),
          ListTile(
            leading: Text('Status :', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(''),
            title: Text(date),
          ),
          ListTile(
            leading: Text('Review :', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(''),
            title: Text(reviews),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: double.infinity,
                onPressed: () => {Navigator.pop(context)},
                child: Text('Back'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

