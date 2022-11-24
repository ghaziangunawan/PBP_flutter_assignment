import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/AddBudgetInfo.dart';
import 'package:counter_7/BudgetData.dart';
import 'package:counter_7/mywatchlist.dart';
import 'package:counter_7/detail.dart';


class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Adding clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Routing the menu to the main page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'counter')),
              );
            },
          ),
          ListTile(
            title: const Text('Add Budget Info'),
            onTap: () {
              // Routing the menu to the form page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Budget Data'),
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context) => const MyDataPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Mywatchlist'),
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context) => const mywatchlist()),
              );
            },
          ),
        ],
      ),
    );
  }
}