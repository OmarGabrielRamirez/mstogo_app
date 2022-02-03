// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mining_solutions/theme.dart';

import 'details_product.dart';

class ProductsAllPage extends StatefulWidget {
  final int idCategory;
  final String nameCategory;
  const ProductsAllPage(
      {Key? key, required this.idCategory, required this.nameCategory})
      : super(key: key);

  @override
  State<ProductsAllPage> createState() => _ProductsAllPageState();
}

class _ProductsAllPageState extends State<ProductsAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryClr,
        title: Text(widget.nameCategory),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailsProductPage(
                    descrption:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad',
                    imageAsset:
                        'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/productos_270x270-px-arena4D.png',
                    measures: '1.65',
                    titleProduct: 'Arena 4D',
                    weight: '-3/16” + 0',
                    category: widget.nameCategory,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3.0,
              child: Container(
                height: 80,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primaryClr,
                  ),
                  title: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 2),
                    child: Text('Arena 4D'),
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
