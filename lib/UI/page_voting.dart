import 'package:Votop/models/models.dart';
import 'package:flutter/material.dart';
import './ui.dart';
import './components/components.dart';

class Voting extends StatelessWidget {
  Voting({Key? key, required this.poll}) : super(key: key);
  final PollModel poll;

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Votação'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            poll.title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            poll.description,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 150),
            child: Divider(height: 25),
          ),
          ButtonBack(),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 500,
                  child: ListView.builder(
                    itemCount: poll.options.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          key: ValueKey(index),
                          title: Text(poll.options[index]['title']),
                          onTap: () {
                            try {
                              poll.registerVote(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Voto registrado'),
                                ),
                              );
                              Navigator.of(context).pop();
                            } on Exception catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Não foi possível registrar o voto'),
                                ),
                              );
                              throw e;
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
