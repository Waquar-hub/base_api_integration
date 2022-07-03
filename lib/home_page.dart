import 'package:base_api_integration/controller/test_controller.dart';
import 'package:base_api_integration/services/Base_url.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter base url creating"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Get Data"),
              onPressed: () async {
                controller.getData();
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Post Data"),
              onPressed: () async {
                controller.postData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
