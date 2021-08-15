import 'package:flutter/material.dart';
import 'package:votop/UI/page_welcome.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Painel'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: InkWell(
              onTap: () {
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
            ),
          )
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
                            'Gerenciar\nVotações',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            Icons.manage_accounts_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Editar Perfil',
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
                            Icons.query_stats_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Relatórios',
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
