import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class APage extends StatelessWidget {
  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), backgroundColor: Colors.red, body: Container());
  }
}
