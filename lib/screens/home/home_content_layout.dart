import 'package:flutter/material.dart';
import 'package:mining_solutions/screens/home/home_content.dart';
import 'package:mining_solutions/screens/home/home_content_skeleton.dart';

class HomeContentLayout extends StatefulWidget {
  const HomeContentLayout({Key? key}) : super(key: key);

  @override
  State<HomeContentLayout> createState() => _HomeContentLayoutState();
}

class _HomeContentLayoutState extends State<HomeContentLayout> {
  bool _status = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _status = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _status ? const HomeContentSkeleton() : const HomeContent(),
    );
  }
}
