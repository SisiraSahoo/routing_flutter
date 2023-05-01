import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  static const String routeName = '/unknown';
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Unknown page")),
    );
  }
}
