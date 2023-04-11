import 'package:final_exam_flutter/Scrrens/Home/Home_scrren.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => Home_scrren(),
      },
    ),
  );
}