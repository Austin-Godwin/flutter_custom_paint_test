import 'package:custom_paint_test/views/custom_paint/component/circle.dart';
import 'package:custom_paint_test/views/custom_paint/component/curves.dart';
import 'package:custom_paint_test/views/custom_paint/component/line.dart';
import 'package:custom_paint_test/views/custom_paint/component/rectangle.dart';
import 'package:custom_paint_test/views/custom_paint/component/smiley.dart';
import 'package:custom_paint_test/views/custom_paint/component/triangle.dart';
import 'package:flutter/material.dart';

class CustomPaintScreen extends StatefulWidget {
  const CustomPaintScreen({Key? key}) : super(key: key);

  @override
  State<CustomPaintScreen> createState() => _CustomPaintScreenState();
}

class _CustomPaintScreenState extends State<CustomPaintScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;
  @override
  void initState() {
    _tabcontroller = TabController(length: 6, vsync: this);
    super.initState();
  }

  bool onTapped = false;

  onScreenTap() {
    setState(() {
      if (!onTapped) {
        print("doubledTapped");
        Icon(
          Icons.favorite,
          size: 100.0,
          color: Colors.grey.withOpacity(0.5),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black45,
        toolbarHeight: 30.0,
        titleSpacing: 0.0,
        bottom: TabBar(
          isScrollable: true,
          controller: _tabcontroller,
          tabs: const [
            Tab(text: "Line"),
            Tab(text: "Circle"),
            Tab(text: "Rectangle"),
            Tab(text: "Triangle"),
            Tab(text: "Curves"),
            Tab(text: "Smiley🙂"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: [
          const Center(child: Line()),
          const Center(child: Circle()),
          const Center(child: Rectangle()),
          const Center(child: Triangle()),
          Center(
              child: Column(
            children: [
              GestureDetector(
                onTap: onScreenTap,
                child: const CustomCurves(),
              ),
            ],
          )),
          const Center(child: Smiley()),
        ],
      ),
      // Column(
      //   children: [
      //     Container(
      //       height: 100.0,
      //       color: Colors.black,
      //       child: Column(
      //         children: [
      //           Container(
      //             height: 83.0,
      //             color: Colors.black,
      //           ),
      //           TabBar(
      //             isScrollable: true,
      //             controller: _tabcontroller,
      //             tabs: const [
      //               Text("Line"),
      //               Text("Circle"),
      //               Text("Rectangle"),
      //               Text("Triangle"),
      //               Text("Curves"),
      //               Text("Smiley"),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: TabBarView(
      //         controller: _tabcontroller,
      //         children: const [
      //           Center(child: Text("First Page")),
      //           Center(child: Text("Second Page")),
      //           Center(child: Text("Third Page")),
      //           Center(child: Text("Fourth Page")),
      //           Center(child: Text("Fifth Page")),
      //           Center(child: Text("Sixth Page")),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
