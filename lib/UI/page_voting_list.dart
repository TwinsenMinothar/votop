import 'package:Votop/models/models.dart';
import 'package:flutter/material.dart';
import './ui.dart';
import './components/components.dart';
import '../models/poll_model.dart';

class VotingList extends StatefulWidget {
  @override
  _VotingListState createState() => _VotingListState();
}

class _VotingListState extends State<VotingList> {
  List<PollModel> _polls = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadPolls();
  }

  void loadPolls() {
    if (UserModel.of(context).user != null) {
      PollModel.getPolls().then(
        (polls) => setState(() {
          _polls = polls;
          loading = false;
          print('Número de polls carregadas: ${_polls.length}');
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;

    var title = 'Escolha uma votação para participar';

    return Scaffold(
      appBar: AppBar(
        title: Text('VoTop | Votação'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 150),
            child: Divider(height: 25),
          ),
          ButtonBack(),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: loading
                    ? CircularProgressIndicator()
                    : _polls.isEmpty
                        ? Text('Ainda não votações.')
                        : SizedBox(
                            width: 500,
                            child: ListView.builder(
                              itemCount: _polls.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    key: ValueKey(index),
                                    title: Text(_polls[index].title),
                                    subtitle: Text(_polls[index].description),
                                    onTap: () {},
                                  ),
                                );
                              },
                            ),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
