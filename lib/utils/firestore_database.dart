import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDataBase {
  List celeList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("cele-info");

   Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          celeList.add(result.data());
        }
      });

      return celeList;
    } catch (e) {
      return e;
    }
  }
}