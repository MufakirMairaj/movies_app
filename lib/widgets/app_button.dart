import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function? function;
  final Color color;

  const AppButton(
      {Key? key, required this.title, this.function, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style:  GoogleFonts.montserrat(fontSize: 20),
      ),
      onPressed: () {
        if (function != null) function!();
      },
      style: ElevatedButton.styleFrom(primary: color),
    );
  }
}
