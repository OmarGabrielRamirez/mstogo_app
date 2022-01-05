import 'package:flutter/material.dart';

import 'package:mining_solutions/widgets/button_model.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
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
              ButtonStyles(
                child: Text("Confirmar Pedido", style: buttonTextStyle),
                color: Colors.green,
                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              SizedBox(height: 30.0),
              ButtonStyles(
                child: Text("Cancelar pedido", style: buttonTextStyle),
                color: Colors.red,
                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(height: 30.0),
              ButtonStyles(
                child: Text("Programar envío", style: buttonTextStyle),
                color: Colors.indigo,
                border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
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
