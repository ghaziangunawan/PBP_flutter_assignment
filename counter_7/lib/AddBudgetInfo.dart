import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/BudgetData.dart';
import 'package:counter_7/drawer.dart';


class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

var budgetList = [];

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();

    String _title = "";
    int _amount = 0;
    String _budgetType = "income";
    List<String> listBudgetType = ['income','expense'];
    String test = "";
    var BudgetDataList = [];
    var BudgetData = [];
    DateTime date = DateTime(2022,12,14); 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Form'),
            ),
             drawer: drawer(),
              
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                    Padding(
                    // Using padding of 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Example: Buy New Phone",
                            labelText: "Title",
                            // Added a circular border to make it neater
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Added behavior when name is typed 
                        onChanged: (String? value) {
                            setState(() {
                                _title = value!;
                            });
                        },
                        // Added behavior when data is saved
                        onSaved: (String? value) {
                            setState(() {
                                _title = value!;
                            });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Title cannot be empty!';
                            }
                            return null;
                        },
                    ),
                ),

                    Padding(
                      // Using padding of 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Amount",
                        labelText: "Example: 200\$",
                        // Added a circular border to make it neater
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        // Added behavior when name is typed 
                        onChanged: (String? value) {
                            setState(() {
                                _amount = int.parse(value!);
                            });
                        },
                        // Added behavior when data is saved
                        onSaved: (String? value) {
                            setState(() {
                                _amount = int.parse(value!);
                            });
                        },
                        // Validator as form validation
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                _amount = 0;
                            }
                            return null;
                        },
                      ),
                    ),
                    Container(
                      child: DropdownButton(
                        value: _budgetType,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: listBudgetType.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));}).toList(),
                        
                        onChanged: (String? newValue) {
                        setState(() {
                          _budgetType = newValue!;
                        });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child:ElevatedButton(
                        child: Text('Select Date'),
                        onPressed: () async {
                        DateTime? newDate = await  showDatePicker(
                          context:context,
                          initialDate: date, 
                          firstDate: DateTime(1900), 
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return; 
                          setState(() => date = newDate);
                        }, 
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top:20),
                      child:TextButton(
                        child: const Text("Save",style: TextStyle(color: Colors.white)),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BudgetData = ['$_title','$_amount','$_budgetType','${date.year}/${date.month}/${date.day}'];
                          budgetList.add(BudgetData);
                          showDialog(
                            context: context,
                            builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                              child: ListView(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(child: const Text('Informasi Data')),
                                  Center(child: const Text('')),
                                  SizedBox(height: 20),
                                  Center(child:Text('Data Successfully Added')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
                                  ),
                                ],
                              ),
                              ),
                            );
                            },
                          );
                        }
                      },
                      ),
                      ), 
                  ],
                  ),
                ),
              ),
            ),
        );
    }
}
