import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  final String text;

  const ShowErrorWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
