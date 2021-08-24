import 'package:Votop/UI/page_report.dart';
import 'package:Votop/models/models.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './components/components.dart';
import '../UI/ui.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Painel ADM'),
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
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
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
            child: SingleChildScrollView(
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
                        nextPage: () => VotingList(
                          title: 'Escolha uma votação para gerenciar',
                          onChoosing: (poll) {
                            // TODO: Navegação ao clicar
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (context) => Voting(poll)),
                            // );
                          },
                        ),
                        icon: Icons.note_alt_rounded,
                        color: _primaryColor,
                        title: 'Gerenciar\nVotações',
                      ),
                      CardButton(
                        nextPage: () => CreationNewVote(),
                        icon: Icons.add_task_rounded,
                        color: _primaryColor,
                        title: 'Criar Votação',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CardButton(
                        nextPage: () => EditProfile(),
                        icon: Icons.manage_accounts_rounded,
                        color: _primaryColor,
                        title: 'Editar Perfil',
                      ),
                      CardButton(
                        title: 'Relatórios',
                        color: _primaryColor,
                        icon: Icons.query_stats_rounded,
                        nextPage: () => VotingList(
                          title: 'Escolha uma votação',
                          onChoosing: (poll) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Report(poll: poll),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
