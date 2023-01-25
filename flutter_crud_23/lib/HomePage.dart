// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_23/models/model.dart';
import 'package:flutter_crud_23/provider/Crud_firebase.dart';
import 'package:flutter_crud_23/provider/providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CRUD FIREBASE'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Crud()));
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var allalunos = snapshot.data!.docs
                  .map((aluno) => Aluno.fromSnapShot(aluno))
                  .toList();

              return ListView.builder(
                  itemCount: allalunos.length,
                  itemBuilder: (context, index) {
                    var id = snapshot.data!.docs[index].id;

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Crud(
                                      aluno: allalunos[index],
                                      id: id,
                                    )));
                      },
                      title: Text(allalunos[index].name),
                      subtitle: Text(allalunos[index].tel),
                      trailing: IconButton(
                        onPressed: () {
                          FireStoreService.delAluno(id);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          stream: FirebaseFirestore.instance.collection('aluno').snapshots(),
        )
    );
  }
}
