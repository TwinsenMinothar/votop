import 'package:flutter/material.dart';

class NewVote extends StatelessWidget {
  const NewVote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vo<T>op'),
        centerTitle: true,
      ),
    );
  }
}
