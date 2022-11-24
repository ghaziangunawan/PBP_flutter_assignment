import 'package:flutter/material.dart';
import 'package:counter_7/AddBudgetInfo.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data'),
            ),
        drawer: drawer(),
       
        body: Container(
        child: Column(
          children: [
            for ( var i in budgetList )...{
                Center(child:SizedBox(
                    height: 150,
                    width: double.infinity,
                    child:Card(
                    elevation:10, 
                    child:Column(
                        children:[
                            Column(children:[
                                Padding(padding: const EdgeInsets.only(bottom:60),
                                        child: Row(children:[Text(i[0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40)), Text(i[3]) ]),
                                        ),
                                Row(
                                    children:[
                                        Text((i[1]).toString() + "\$",style:TextStyle(fontSize: 25)),
                                        Spacer(),
                                        Text(i[2],style:TextStyle(fontSize: 25)),
                                    ]
                                )
                            ]),
                        ]
                    ),
                ),
                ),
                ),
            }
          ],
        ),
      ),
   

        );
    }
} 
