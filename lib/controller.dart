import 'package:mobx/mobx.dart';
import 'models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName(){
    if(client.name == null || client.name.isEmpty){
      return 'Este campo é obrigatório';
    } else if (client.name.length < 3){
      return 'Serão aceitos somente nomes com mais de 3 caracteres';
    }

    return null;
  }

  String validateEmail(){
    if(client.email == null || client.email.isEmpty){
      return 'Este campo é obrigatório';
    } else if (!client.email.contains('@')){
      return 'Não é um email válido';
    }

    return null;
  }
}