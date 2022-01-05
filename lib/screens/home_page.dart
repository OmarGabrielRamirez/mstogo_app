import 'package:flutter/material.dart';

import 'package:mining_solutions/widgets/button_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo de botones"),
      ),
      body: Column(children: [
        ButtonStyles(
          child: Text("Confirmar Pedido"),
          color: Colors.green,
          border:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        ButtonStyles(
          child: Text("Cancelar pedido"),
          color: Colors.red,
          border:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        ),
        ButtonStyles(
          child: Text("Programar envío"),
          color: Colors.indigo,
          border:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'second');
        },
      ),
    );
  }
}
