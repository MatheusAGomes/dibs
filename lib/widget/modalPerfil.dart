import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';
import 'textfieldpadrao.dart';

class ModalPerfil extends StatelessWidget {
  ModalPerfil();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meu perfil',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              Text('Dados Pessoais',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Nome',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                      hintText: 'ex:Joao',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobrenome',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                      hintText: 'ex:Roberto',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CPF',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.badge,color: Colors.grey,),
                      hintText: 'ex: 123.456.789-00',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data de nascimento',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.calendar_month_sharp,color: Colors.grey,),
                      hintText: 'ex: 20/09/2001',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.mail_outline,color: Colors.grey,),
                      hintText: 'ex: joao@gmail.com',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telefone',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.call,color: Colors.grey,),
                      hintText: 'ex: (11) 99753-7095',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorService.verde,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),              Text('Alterar senha',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Senha atual',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                      hintText: '**********',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Nova senha',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                      hintText: 'ex: (11) 99753-7095',
                      click: () {},
                      semMensagem: false,
                      padding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Alterar senha',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorService.verde,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
