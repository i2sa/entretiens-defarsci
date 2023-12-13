import 'package:flutter/material.dart';

class DetailsEntretiens extends StatefulWidget {
  const DetailsEntretiens({super.key});

  @override
  State<DetailsEntretiens> createState() => _detailsEntretiensState();
}

class _detailsEntretiensState extends State<DetailsEntretiens> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text("details"),
      ),
    );
  }
}
