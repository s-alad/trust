import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trust/models/task.dart';
import 'package:trust/services/auth.dart';

class DataBaseService {
  final String? uid;
  DataBaseService({this.uid});
  final CollectionReference populationCollection =
      FirebaseFirestore.instance.collection('population');
  //final CollectionReference taskCollection = populationCollection.taskCollection;

  Future initUserData() async {
    print("initing");
    print(uid);
    return await populationCollection.doc(uid).set({
      "userid": uid,
      "tasks": [
        Task(name: 'lol', text: 'xd').toJson(),
        Task(name: 'deez', text: 'nuts').toJson()
      ]
    });
  }

  //unused. just a base model for later
  List<Task> _tasksFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Task(
        name: doc.get('name') ?? '',
        text: doc.get('tasks') ?? [],
      );
    }).toList();
  }

  Stream<DocumentSnapshot<Object?>> get tasks {
    final AuthService _auth = AuthService();
    Stream<DocumentSnapshot<Object?>> popCol =
        populationCollection.doc(_auth.getId()).snapshots();
    print("THIS IS THE POP CL");
    popCol.first.then((value) {
      print(value.data());
    });
    return popCol;
  }
}
