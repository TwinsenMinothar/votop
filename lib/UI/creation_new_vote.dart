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
  late PollModel poll;

  CreationNewVote() {
    poll = new PollModel('Título da votação', 'Sua descrição da votação');
    options = [];
    for (var option in this.poll.options) {
      options.add(new Option(option['title']));
    }
  }

  saveOptions() async {
    List<String> titles = [];
    for (var option in options) titles.add(option.titleController.text);
    await this.poll.saveOptions(titles);
  }

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
                        labelText: 'Descrição', icon: Icon(Icons.description)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return options[index];
                    },
                    itemCount: options.length,
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
                    ButtonContinue(
                        nextPage: () => AdminPanel(),
                        save: () async {
                          this.widget.poll.setAttrs(titleController.text,descriptionController.text);
                          await this.widget.poll.createPoll();
                          await this.widget.saveOptions();
                        }),
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
