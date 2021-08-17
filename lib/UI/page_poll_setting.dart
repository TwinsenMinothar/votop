import 'package:flutter/material.dart';

import './ui.dart';
import 'components/components.dart';
import '../models/models.dart';

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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CardOption(settingOptions[index]);
                },
                itemCount: settingOptions.length,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonBack(),
                    ButtonContinue(nextPage: () => IdentificationUser()),
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


