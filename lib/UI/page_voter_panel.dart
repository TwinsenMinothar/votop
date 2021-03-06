import 'package:Votop/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './ui.dart';
import './components/components.dart';

class VoterPanel extends StatelessWidget {
  const VoterPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Painel'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                return InkWell(
                  onTap: () {
                    model.signOut();

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => WelcomePage()));
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
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return Container(
            height: double.infinity,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Bem vindo ao VoTop, ${model.userData['name']}',
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
                    CardButton(
                      title: 'Depositar\nVoto',
                      color: _primaryColor,
                      icon: Icons.note_alt_rounded,
                      nextPage: () => VotingList(
                        title: 'Escolha uma vota????o para participar',
                        onChoosing: (poll) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Voting(poll: poll),
                            ),
                          );
                        },
                      ),
                    ),
                    CardButton(
                      nextPage: () => EditProfile(),
                      icon: Icons.manage_accounts_rounded,
                      color: _primaryColor,
                      title: 'Editar Perfil',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
