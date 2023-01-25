import 'package:flutter_crud_23/models/model.dart';
import 'package:flutter_crud_23/provider/providers.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({super.key, this.aluno, this.id});

  final Aluno? aluno;
  final String? id;

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  late TextEditingController namecontroller;
  late TextEditingController telcontroller;
  late TextEditingController emailcontroller;
  late TextEditingController senhacontroller;

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController();
    telcontroller = TextEditingController();
    emailcontroller = TextEditingController();
    senhacontroller = TextEditingController();

    if (widget.aluno != null) {
      namecontroller.text = widget.aluno!.name;
      telcontroller.text = widget.aluno!.tel;
      emailcontroller.text = widget.aluno!.email;
      senhacontroller.text = widget.aluno!.senha;
    }
  }

  @override
  void dispose() {
    namecontroller.dispose();
    telcontroller.dispose();
    emailcontroller.dispose();
    senhacontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Page'),
        actions: [
          IconButton(
            onPressed: () async {
              if (widget.aluno != null) {
                await FireStoreService.editAluno(
                    Aluno(
                        name: namecontroller.text,
                        tel: telcontroller.text,
                        email: emailcontroller.text,
                        senha: senhacontroller.text),
                    widget.id!);
                Navigator.pop(context);
              } else {
                await FireStoreService.addAluno(
                    Aluno(
                        name: namecontroller.text,
                        tel: telcontroller.text,
                        email: emailcontroller.text,
                        senha: senhacontroller.text),
                    );
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: 'Digite seu nome',
                label: Text('Nome'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: telcontroller,
              decoration: InputDecoration(
                hintText: 'Digite o telefone',
                label: Text('Telefone'),
              ),
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: 'Digite o e-mail',
                label: Text('E-mail'),
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: senhacontroller,
              decoration: InputDecoration(
                hintText: 'Digite a senha',
                label: Text('Senha'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
