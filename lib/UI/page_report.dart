import 'package:Votop/models/models.dart';
import 'package:flutter/material.dart';
import './components/components.dart';

class Report extends StatelessWidget {
  Report({Key? key, required this.poll}) : super(key: key);
  final PollModel poll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Relatório'),
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
                      return Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Card(
                              child: ListTile(
                                key: ValueKey(index),
                                title: Text(poll.options[index]['title']),
                                onTap: () {},
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(child: Text('${poll.options[index]['votes']} votos')),
                        ],
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
