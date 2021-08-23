import 'package:Votop/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './ui.dart';

class VoterPanel extends StatelessWidget {
  const VoterPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Painel'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfile()));
          },
          child: Icon(Icons.person),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                return InkWell(
                  onTap: () {
                    model.signOut();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => WelcomePage()
                    ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Sair'),
                        SizedBox(width: 10),
                        Icon(Icons.exit_to_app),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Bem vindo ao VoTop, Fulano de Tal',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: Divider(height: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Card(
                    color: _primaryColor,
                    margin: EdgeInsets.all(50),
                    child: Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.note_alt_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Depositar\nVoto',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewVote()));
                  },
                  child: Card(
                    color: _primaryColor,
                    margin: EdgeInsets.all(50),
                    child: Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_task_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Criar\nVotação',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
