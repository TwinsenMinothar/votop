import 'package:flutter/material.dart';

import './ui.dart';
import 'components/components.dart';

class NewVote extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vo<T>op'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Qual é a ocasião?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Titulo', icon: Icon(Icons.subject)),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  labelText: 'Descrição', icon: Icon(Icons.description)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBack(),
                  ButtonContinue(nextPage: () => VoteOption()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}