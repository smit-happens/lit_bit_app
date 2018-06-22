import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AppBar Title"),
      ),

      drawer: new Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              title: Text('ListTitle Title 1'),
              subtitle: Text("Subtitle"),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Item 2'),
              subtitle: Text("Select this item to die instantly."),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: new SizedBox(
        height: 210.0,
        child: new Card(
          child: new Column(
            children: [
              new ListTile(
                title: new Text('ListTile Title',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle: new Text('ListTile Subtitle'),
                leading: new Icon(
                  Icons.bluetooth,
                  color: Colors.blue[500],
                ),
              ),
              new Divider(),
              new RaisedButton(
                  child: const Text('Here\'s a button!'),
                  color: Theme.of(context).accentColor,
                  elevation: 5.0,
                  splashColor: Colors.deepOrange,
                  onPressed: () {
                    print("You pressed the button. Good job!");
                  })
            ], // Children
          ),
        ),
      ),
    );
  }
}
