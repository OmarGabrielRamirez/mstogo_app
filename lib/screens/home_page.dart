import 'package:flutter/material.dart';
import 'package:mining_solutions/screens/second_page.dart';

import 'package:mining_solutions/widgets/button_model.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo de botones"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ButtonStyles(
            child: Text("Confirmar Pedido", style: bodyTextStyle),
            color: Colors.green,
            border:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),

          SizedBox(height: 30.0),

          ButtonStyles(
            child: Text("Cancelar pedido", style: bodyTextStyle),
            color: Colors.red,
            border:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          ),

          SizedBox(height: 30.0),


          ButtonStyles(
            child: Text("Programar envío", style: bodyTextStyle),
            color: Colors.indigo,
            border:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {
          Navigator.pushReplacementNamed(context, SeconPage.name);
        },
      ),
    );
  }
}
