import 'package:flutter/material.dart';

import './ui.dart';
import 'components/components.dart';

class VoteOption extends StatefulWidget {
  @override
  _VoteOptionState createState() => _VoteOptionState();
}

class _VoteOptionState extends State<VoteOption> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vo<T>op'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Quais são as opções?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        options.add(Option());
                      });
                    },
                    child: Text('Adicionar opção'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: options.length > 2 ? () {
                      setState(() {
                        options.removeLast();
                      });
                    } : null,
                    child: Text('Remover última opção'),
                  ),
                ],
              ),
            ),
            Divider(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              itemBuilder: (BuildContext context, int index) {
                  return options[index];
              },
              itemCount: options.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonBack(),
                ButtonContinue(nextPage: () => PollSetting()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
