import 'package:Votop/ui/components/components.dart';
import 'package:firedart/firedart.dart';
import 'package:firedart/firestore/models.dart';

class PollModel {
  String title;
  String description;
  DocumentReference? ref;
  List<Map<String, dynamic>> options = List.of([
    {
      'title': "Opção 1",
      'votes': 0,
    },
    {
      'title': "Opção 2",
      'votes': 0,
    },
  ]);

  PollModel(this.title, this.description);

  createPoll() async {
    try {
      Document docPoll = await Firestore.instance.collection('poll').add({
        'title': this.title,
        'description': this.description,
        'options': this.options,
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      });
      this.ref = docPoll.reference;
    } on Exception catch (e) {
      throw e;
    }
  }

  saveOptions(List<String> titles) async {
    this.options = [];
    for (var title in titles) {
      this.options.add({
        'title': title,
        'votes': 0,
        'updated_at': DateTime.now(),
      });
    }
    try {
      await this.ref!.update({'options': this.options});
    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<List<PollModel>> getPolls() async {
    try {
      var page = await Firestore.instance.collection('poll').get();
      return page.map((doc) {
        var pm = PollModel(doc['title'], doc['description']);
        pm.options = doc['options'].cast<Map<String, dynamic>>();
        pm.ref = doc.reference;
        return pm;
      }).toList();
    } on Exception catch (e) {
      throw e;
    }
  }
}
