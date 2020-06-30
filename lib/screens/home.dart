import 'package:flutter/material.dart';
 

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Color(0xFF7B1FA2),
        title: Text("Home")

      ),
      body: Center(
        child: Column(
           children: <Widget> [
         new MaterialButton(
          onPressed: null,
          color: Colors.red[300],
        child: Text('chat rooms'), 
        minWidth: 100.0,
        height: 100.0,),

         new MaterialButton(onPressed:  null,
        color: Colors.red[300],
        child: Text('updates'), 
        minWidth: 100.0,
        height: 100.0,),
         
        new MaterialButton(onPressed: null,
        color: Colors.red[300],
        child: Text('membership',), 
        minWidth: 100.0,
        height: 100.0,), 
        ]
        )
      ),
    );
  }
}

class _purplePrimaryValue {
}
