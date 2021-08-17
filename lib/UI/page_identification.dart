import 'package:flutter/material.dart';

import 'components/components.dart';

class IdentificationUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vo<T>op'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Tell your participants who you are',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name', icon: Icon(Icons.person)),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email', icon: Icon(Icons.email)),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBack(),
                  ButtonContinue(nextPage: ()=> null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
