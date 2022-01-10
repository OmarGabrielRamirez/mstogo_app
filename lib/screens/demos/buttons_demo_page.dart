import 'package:flutter/material.dart';

import 'package:mining_solutions/widgets/button_model.dart';

import '../../theme.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo de botones"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Button(
                color: Colors.green,
              ),
              SizedBox(height: 30.0),
              Button(
                color: Colors.red,
              ),
              SizedBox(height: 30.0),
              Button(
                color: Colors.indigo,
              )
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {
          Navigator.pushReplacementNamed(context, "second");
        },
      ),
    );
  }
}
