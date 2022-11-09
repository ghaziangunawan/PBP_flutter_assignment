# Assignment 7 


## Counter_7

**- Explain what is meant by stateless widget and stateful widget and explain the difference between them.**<br>
Stateless Widget is widgets that does not have state objects meaning that it does not subjects to state changes or immutable. Meanwhile Stateful widget has a state object which is mutable and can subjects to change of state. For example, if we want to add a incrementer/decrementer functionality to our app then we need to have a stateful widget this is due to that in stateless widget we cannot add setState() function so the incrementer/decrementer wont change the initial state.
 
**- Mention what widgets you use in this project and explain their functions.**<br>
1. StatelessWidget - for creating the user interface
2. myApp - root widget
3. MaterialApp - wrapper for design of the app
4. ThemeData - to describe the theme of the app
6. StatefulWidget - for creating the main logic part and buttons of the app
7. MyHomePage - Root widget
8. Scaffold - For creatingthe visual layout structure
9. appBar - Navbar of the app
10. Center - Layout widget to position child in the middle of the parent
11. Column - Layout widget to arrange vertically
12. Row - Layout widget arrange horizontally
13. Text - for creating texts
14. TextStyle - adding styles for text
15. Container - for wrapping elements to add margin
16. FloatingActionButton - Adding button

**- What is the function of setState()? Explain what variables can be affected by the function.**<br>
setState() is a methode that is used to change the state for a stateful widget. It will tell the flutter framework that the internal state of the app has changed. It will trigger a rebuild of the app so we can see the change immediately. In my created app, setState is implemented with variable '_counter' to increment and decrement it_ 

**- Explain the difference between const and final.**<br>
They both behaved exactly the same where we can enter values in it and cannot be changed in the future. The difference between both is const is created on compile time, meanwhile final is on run-time. In addition, if we have collection assigned to const, that item in the collection is also immutable, meanwhile in final the collection item is mutable

**-  Explain how you implement the checklist above.**<br>
1. run flutter create counter_7 to generate the necessary file and template for the main.dart file.

2. Add the decrementer function in the stateful widget
``` dart
  void _decrementCounter(){
    setState((){
      if(_counter > 0 ){
        _counter--;
      }
    });
  }
```
3. modify the body widget to display wether it is odd or even number using IF-ELIF

```dart
    children: <Widget>[ 
            if((_counter % 2) == 0)...[
              Text("Even",
              style: TextStyle(color:Colors.red)),
            ]else...[
              Text("Odd",
              style: TextStyle(color:Colors.blue))
            ],
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
```
4. Modify the floatingActionButton widget so it has two buttons with the correct position and the associated function

```dart
      floatingActionButton:  Row(
        children :[
          if(_counter != 0)...[
             Container(
            margin: EdgeInsets.only(left:20),
            child: 
            FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            ), 
          ),
          ],
          Spacer(),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), 
        ]
      )
```
5. git add,commit,push to github
