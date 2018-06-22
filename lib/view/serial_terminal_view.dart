import 'package:flutter/material.dart';

class SerialTerminalView extends StatefulWidget {
  // const SerialTerminalView({
  //   Key key
  // }) : super(key: key);

  @override
  _SerialTerminalViewState createState() => new _SerialTerminalViewState();
}

class _SerialTerminalViewState extends State<SerialTerminalView> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Serial Terminal"),
      ),
      body: new SizedBox(
        // height: 500.0,

        child: new Card(
          child: new Column(
            children: [
              TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  // fillColor: Colors.black,
                  // filled: true,
                  border: InputBorder.none,
                  hintText: "Type something here.",
                ),
              )
            ], // Children
          ),
        ),
      ),
    );
  }
}
