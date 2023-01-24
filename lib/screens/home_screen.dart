import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.greenAccent.shade100,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              "Hold the button and start Speaking",
              style: TextStyle(color: Colors.white, fontSize: 12),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(vertical: 6),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return chatBubble(
                        chatText: "Hey How are you doing ?",
                        type: MessageType.user,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.greenAccent.shade100,
        tooltip: 'Increment',
        child: const Icon(
          Icons.keyboard_voice_outlined,
          color: Colors.black,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget chatBubble({required chatText, required MessageType type}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.person,
            color: Colors.greenAccent.shade200,
            size: 18,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: Text(
              "$chatText",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
