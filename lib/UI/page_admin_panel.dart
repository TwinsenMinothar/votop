import 'package:flutter/material.dart';

import './components/components.dart';
import '../UI/ui.dart';

class AdminPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    var title = 'Bem vindo ao VoTop, ADM';

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Painel ADM'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              label: Text(
                'SAIR',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
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
                    nextPage: () => Scaffold(),
                    icon: Icons.note_alt_rounded,
                    color: _primaryColor,
                    title: 'Gerenciar\nVotações',
                  ),
                  CardButton(
                    nextPage: () => Scaffold(),
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
                    nextPage: () => Scaffold(),
                    icon: Icons.query_stats_rounded,
                    color: _primaryColor,
                    title: 'Relatórios',
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

