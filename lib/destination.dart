import 'package:flutter/material.dart';

class Destination extends StatefulWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Destination Page',style: TextStyle(color: Colors.grey),),
      ),
    );
  }
}
