import 'package:Votop/UI/components/components.dart';
import 'package:flutter/material.dart';

class VoteUser extends StatefulWidget {
  const VoteUser({Key? key}) : super(key: key);

  @override
  _VoteUserState createState() => _VoteUserState();
}

class _VoteUserState extends State<VoteUser> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de votação'),
      ),
      body: Column(
        children: [
          for (int i = 1; i <= options.length; i++)
            ListTile(
              title: Text(
                options[i].title,
              ),
              leading: Radio(
                value: i,
                groupValue: _value,
                activeColor: Color(0xFF6200EE),
                onChanged:(int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
              ),
            ),
        ],
      ),
    );
  }
}
