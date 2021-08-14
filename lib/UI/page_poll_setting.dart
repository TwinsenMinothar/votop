import 'package:flutter/material.dart';

import './ui.dart';

class PollSetting extends StatefulWidget {
  const PollSetting({Key? key}) : super(key: key);

  @override
  _PollSettingState createState() => _PollSettingState();
}

class _PollSettingState extends State<PollSetting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vo<T>op'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CardOption(
                OptionSetting(
                  iconData: Icons.check,
                  title: 'Yes, no, if need be',
                  description:
                      'Participants can indicate if an option is not ideal for them.',
                ),
              ),
              CardOption(
                OptionSetting(
                  iconData: Icons.group,
                  title: 'Limit the number of votes per option',
                  description:
                      'First come, first served. Once the spots are filled, the option is no longer available.',
                ),
              ),
              CardOption(
                OptionSetting(
                  iconData: Icons.looks_one,
                  title: 'Limit participants to a single vote',
                  description: 'Participants can only select one option.',
                ),
              ),
              CardOption(
                OptionSetting(
                  iconData: Icons.visibility_off,
                  title: 'Hidden poll',
                  description:
                      'Participants’ names, comments and votes are confidential. Only you can see the results.',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IdentificationUser()));
                      },
                      child: Text('Continue'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionSetting {
  final IconData iconData;
  final String title;
  final String description;

  OptionSetting({
    required this.iconData,
    required this.title,
    required this.description,
  });

  bool selected = false;
}

class CardOption extends StatefulWidget {
  final OptionSetting optionSetting;

  CardOption(this.optionSetting);

  @override
  _CardOptionState createState() => _CardOptionState();
}

class _CardOptionState extends State<CardOption> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: widget.optionSetting.selected != false,
        onChanged: (bool? value) {
          setState(() {
            if (widget.optionSetting.selected == false) {
              widget.optionSetting.selected = true;
            } else {
              widget.optionSetting.selected = false;
            }
          });
        },
        title: Text(widget.optionSetting.title),
        subtitle: Text(widget.optionSetting.description),
        secondary: Icon(widget.optionSetting.iconData),
      ),
    );
  }
}
