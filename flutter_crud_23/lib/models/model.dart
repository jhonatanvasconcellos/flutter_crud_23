import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Aluno {
String name;
String tel;
String email;
String senha;

  Aluno({
    required this.name,
    required this.tel,
    required this.email,
    required this.senha,
  });

Map<String, dynamic>toJson(){
  return {
    'name' : name,
    'tel' : tel,
    'email': email,
    'senha' : senha
  };
}

factory Aluno.fromSnapShot(QueryDocumentSnapshot<Map<String, dynamic>>json){
  return Aluno(name: json['name'], tel: json['tel'], email: json['email'], senha:json['senha']);
}
}
