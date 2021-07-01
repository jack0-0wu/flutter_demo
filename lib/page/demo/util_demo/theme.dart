import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/util_demo/theme_provider.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project LetsKeep
 * @date 2021/5/26
 */

class Theme1 extends AppTheme {
  final Color backgroundColor = Color(0xFFF2F5FA);
  final Color primaryColor = Colors.white;
  final TextStyle titleStyle = TextStyle(
    fontSize: 42.s,
    fontWeight: FontWeight.bold,
    color: Color(0xFF06112D),
  );
  final TextStyle fontStyle = TextStyle(
    fontSize: 36.s,
    fontWeight: FontWeight.bold,
    color: Color(0xFF06112D),
  );
}

class Theme2 extends AppTheme {
  final Color backgroundColor = Colors.blue;
  final Color primaryColor = Colors.amber;
  final TextStyle titleStyle = TextStyle(
    fontSize: 42.s,
    fontWeight: FontWeight.bold,
    color: Colors.amber,
  );
  final TextStyle fontStyle = TextStyle(
    fontSize: 36.s,
    fontWeight: FontWeight.bold,
    color: Colors.amber,
  );
}

class Theme3 extends AppTheme {
  final Color backgroundColor = Colors.black;
  final Color primaryColor = Colors.grey;
  final TextStyle titleStyle = TextStyle(
    fontSize: 42.s,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final TextStyle fontStyle = TextStyle(
    fontSize: 36.s,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
