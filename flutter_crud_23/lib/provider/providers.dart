import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_crud_23/models/model.dart';

class FireStoreService {
  //add data
  static Future<void> addAluno(Aluno aluno) async {
    await FirebaseFirestore.instance.collection('aluno').add(aluno.toJson());
  }

  //dell data
  static Future<void> delAluno(String id) async {
    await FirebaseFirestore.instance.collection('aluno').doc(id).delete();
  }

  //edit data
  static Future<void> editAluno(Aluno aluno, String id) async {
    await FirebaseFirestore.instance
        .collection('aluno')
        .doc(id)
        .update(aluno.toJson());
  }
}
