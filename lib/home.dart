import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // instanciando o Controller
  final controller = Controller();

  // para observar a reativade/responsividade
  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            // chamando os observable
            Observer(builder: (_) {
              return _textField(
                errorText: controller.validateName,
                labelText: 'Nome',
                onChanged: controller.client.changeName,
              );
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _textField(
                errorText: controller.validateEmail,
                labelText: 'Email',
                onChanged: controller.client.changeEmail,
              );
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return RaisedButton(
                child: Text('Salvar'),
                onPressed: controller.isValid ? () {} : null,
              );
            }),

            // Observer(builder: (_) {
            //   return _textField(
            //     errorText: controller.validateCPF,
            //     labelText: 'CPF',
            //     onChanged: controller.client.changeCPF,
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
