import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/detail.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class mywatchlist extends StatefulWidget {
  const mywatchlist({ super.key });

  @override
  State<mywatchlist> createState() => _mywatchliststate();
}

class _mywatchliststate extends State<mywatchlist> {
  Future<List<Watchlist>> fetchWatchlist() async {
        var url = Uri.parse('https://pbd-katalog.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // decode the response into the json form
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // convert the json data into watchlist object
        List<Watchlist> listwatchlist = [];
        for (var d in data) {
            if (d != null) {
                listwatchlist.add(Watchlist.fromJson(d));
            }
        }
        return listwatchlist;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mywatchlist'),
      ),
      drawer:drawer(),
       body: FutureBuilder(
        future: fetchWatchlist(),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "To do list is empty :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=>GestureDetector(
                    child:  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                        )
                        ]
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            "${snapshot.data![index].title}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        ],
                    ),
                    ),
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => watchlistdetail(
                        watched: snapshot.data![index].fields.watched,
                        title: snapshot.data![index].fields.title,
                        rating: snapshot.data![index].fields.rating,
                        date: snapshot.data![index].fields.releasedate,
                        review: snapshot.data![index].fields.review,
                      )),
                    );
                  },
                  ) 
                );
            }
            }
        }
       )
    );
  }
}

