# Assignment 8


## Counter_8

**- Explain the difference between Navigator.push and Navigator.pushReplacement.**<br>
- Navigator.push : adds a new route to the navigation stack without deleting the current one
- Navigator.pushReplacement : adds a new route to the navigation stack and then delete the current one by discarding the previous route after adding.

**- List all the widgets you used in this project and explain their functions.**<br>
1. StatelessWidget - for creating the user interface
2. myApp - root widget
3. MaterialApp - wrapper for design of the app
4. ThemeData - to describe the theme of the app
5. StatefulWidget - for creating the main logic part and buttons of the app
6. MyFormPage, MyDataPage - Root widget
7. Scaffold - For creatingthe visual layout structure
8. appBar - Navbar of the app
9. Center - Layout widget to position child in the middle of the parent
10. Column - Layout widget to arrange vertically
11. Row - Layout widget arrange horizontally
12. Text - for creating texts
13. TextStyle - adding styles for text
14. Container - for wrapping elements to add margin
15. ListTile - to display data using leading,center,trailing
16. Navigator - manages page using stack
17. SingleChildViewboxScrolled - making scrollable box for navigation
18. TextFormField - form for textfield
19. Dropdown button - making dropdown form
20. SizedBox - for configuring container size


**- Name the types of events that exist in Flutter (example: onPressed).**<br>
1. onPressed - event to handle pressing of a button
2. onChanged - event to handle changing of a field
3. onEditingComplete - event to handle when user submits editable content (e.g., user presses the "done" button on the keyboard).
4. onTap - event to handle when user tap except for every second tap of a double tap
5. onSaved - to handle  when the form is saved via FormState.save.

**- Explain how the Navigator works in "switching" pages of a Flutter application.**<br>
Navigator in flutter is using the stack structure where every page routing is the element. The top-most of the stack is the one that is being displayed. We can use the push() method to add a new page routing so it will be displayed, also we can use pop() where the top-most will be removed and the navigation will go back to display the previous page where it is now the top-most


**-  Explain how you implement the checklist above.**<br>
1. Creating the necessary dart file 
- AddbudgetInfo for adding the budget data
- BudgetData for displaying the budget data
- Drawer for the drawer widget

2. Create the drawer widget and its navigation button
``` dart
  drawer: Drawer(
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
            ],
        ),
        ),

```
3. Creating the input element for the form

```dart
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

```
4. Adding the save button and storing the form data to a list data structure

```dart
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
```
5. Creating the page to display the data using card for each element 

```Dart
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

```

6. Git add, commit, push to github

