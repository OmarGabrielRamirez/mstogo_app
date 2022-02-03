import 'package:flutter/material.dart';

import '../screens/products_all_page.dart';

class Category extends StatefulWidget {
  final String assetPath;
  final String title;
  final int idCategory;
  const Category(
      {Key? key,
      required this.assetPath,
      required this.title,
      required this.idCategory})
      : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProductsAllPage(idCategory: widget.idCategory, nameCategory: widget.title,),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(2.7, 2.0);
              var end = Offset.zero;
              var curve = Curves.bounceIn;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(widget.assetPath), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(widget.title)
        ],
      ),
    );
  }
}