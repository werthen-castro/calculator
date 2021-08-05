import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  String? erro;

  @observable
  double result = 0;

  @observable
  String expressionTotal = '';

  removerTecla() {
    int tam = expressionTotal.length;
    if (expressionTotal[tam - 1] != ' ') {
      expressionTotal = expressionTotal.substring(0, tam - 1);
    } else {
      expressionTotal = expressionTotal.substring(0, tam - 3);
    }
  }

  operation() {
    List expressionParcial = expressionTotal.split(' ');
    int tam = expressionParcial.length;
    double num1 = 0, num2 = 0;
    String op = '';

    if (expressionParcial.length >= 3) {
      num1 = double.parse(expressionParcial[tam - 3]
          .replaceAll(',', '.')
          .replaceAll('!', '')
          .replaceAll('²', ''));
      op = expressionParcial[tam - 2];
      num2 = double.parse(expressionParcial[tam - 1]
          .replaceAll(',', '.')
          .replaceAll('!', '')
          .replaceAll('²', ''));

      if (result != 0) {
        num1 = result;
      }

      calc(op, num1, num2);
    }
  }

  inverterSinal() {
    result = -result;
  }

  calc(String op, double num1, double num2) {
    switch (op) {
      case '÷':
        result = num1 / num2;
        break;
      case '×':
        result = num1 * num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '+':
        result = num1 + num2;
        break;
    }
  }

  fatorial() {
    List expressionParcial = expressionTotal.split(' ');
    int tam = expressionParcial.length;
    var res =
        expressionParcial[tam - 1].replaceAll(',', '.').replaceAll('!', '');
    int num = 0;
    int fatorial = 1;
    try {
      num = int.parse(res);

      for (int i = num; i >= 1; i--) {
        fatorial *= i;
      }

      result = fatorial.toDouble();
    } catch (e) {
      erro = "operação inválida";
    }
  }

  porcentagem() {
    List expressionParcial = expressionTotal.split(' ');
    int tam = expressionParcial.length;
    var res = expressionParcial[tam - 1];
    result = double.parse(res) / 100.0;
  }

  potencia() {
    List<String> expressionParcial = expressionTotal.split(' ');
    int tam = expressionParcial.length;
    var res = expressionParcial[tam - 1];
    result = double.parse(res) * double.parse(res);
  }

  unicaOperacao(String op) {
    int tam = expressionTotal.length;

    if (expressionTotal[tam - 1] == ' ') {
      expressionTotal = expressionTotal.substring(0, tam - 3);
    } else {
      operation();
    }

    expressionTotal += op;
  }

  @action
  teclar(String op) {
    switch (op) {
      case '←':
        removerTecla();
        break;
      case '÷':
        unicaOperacao(' ÷ ');
        break;
      case '×':
        unicaOperacao(' × ');
        break;
      case '-':
        unicaOperacao(' - ');
        break;
      case '+':
        unicaOperacao(' + ');
        break;
      case '=':
        unicaOperacao(result.toString());
        break;
      case '%':
        porcentagem();
        break;
      case 'π':
        expressionTotal += '3,141592653';
        break;
      case '9':
        expressionTotal += '9';
        break;
      case '6':
        expressionTotal += '6';
        break;
      case '3':
        expressionTotal += '3';
        break;
      case ',':
        expressionTotal += ',';
        break;
      case 'e':
        expressionTotal += '2,718281828';
        break;
      case 'n!':
        fatorial();
        expressionTotal += '!';
        break;
      case '8':
        expressionTotal += '8';
        break;
      case '5':
        expressionTotal += '5';
        break;
      case '2':
        expressionTotal += '2';
        break;
      case '0':
        expressionTotal += '0';
        break;
      case 'C':
        expressionTotal = '';
        result = 0;
        break;
      case 'x²':
        potencia();
        expressionTotal += '²';
        break;
      case '7':
        expressionTotal += '7';
        break;
      case '4':
        expressionTotal += '4';
        break;
      case '1':
        expressionTotal += '1';
        break;
      case '±':
        inverterSinal();
        break;
    }
  }
}
