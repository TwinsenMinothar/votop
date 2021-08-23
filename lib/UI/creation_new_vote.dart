import 'package:Votop/models/models.dart';
import 'package:flutter/material.dart';

import './ui.dart';
import 'components/components.dart';

List<OptionSetting> settingOptions = [
  OptionSetting(
    iconData: Icons.check,
    title: 'Yes, no, if need be',
    description:
        'Participants can indicate if an option is not ideal for them.',
  ),
  OptionSetting(
    iconData: Icons.group,
    title: 'Limit the number of votes per option',
    description:
        'First come, first served. Once the spots are filled, the option is no longer available.',
  ),
  OptionSetting(
    iconData: Icons.looks_one,
    title: 'Limit participants to a single vote',
    description: 'Participants can only select one option.',
  ),
  OptionSetting(
    iconData: Icons.visibility_off,
    title: 'Hidden poll',
    description:
        'Participants’ names, comments and votes are confidential. Only you can see the results.',
  ),
];

class CreationNewVote extends StatefulWidget {
  @override
  _CreationNewVoteState createState() => _CreationNewVoteState();
}

class _CreationNewVoteState extends State<CreationNewVote> {
  TextEditingController descriptionController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    options.add(Option('Nova opção'));
    options.add(Option('Nova opção'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar uma nova Votação '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Qual é a ocasião?',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: 'Titulo', icon: Icon(Icons.subject)),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: 'Descrição',
                        icon: Icon(Icons.description)),
                  ),
                ],
              ),
              Column(
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
                              options.add(Option('Nova opção'));
                            });
                          },
                          child: Text('Adicionar opção'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: options.length > 2
                              ? () {
                                  setState(() {
                                    options.removeLast();
                                  });
                                }
                              : null,
                          child: Text('Remover última opção'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonBack(),
                    ButtonContinue(nextPage: () => AdminPanel()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
