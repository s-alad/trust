import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String? uid;
  DataBaseService({this.uid});
  final CollectionReference population =
      FirebaseFirestore.instance.collection('population');
  //final CollectionReference taskCollection = population.taskCollection;

  Future initUserData() async {
    print("initing");
    print(uid);
    return await population.doc(uid).set({"userid": uid, "tasks": []});
  }

  Stream<QuerySnapshot> get tasks {
    return population.snapshots();
  }
}
