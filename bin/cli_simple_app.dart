import 'dart:io';

import 'package:cli_simple_app/cli_simple_app.dart';

double? a;
double? b;
int? method;

enum ProcessStep { chooseMethod, inputA, inputB }

enum Method { multiply, divide, add, subtract }

var doLoopStep = ProcessStep.chooseMethod;

void main(List<String> arguments) {
  var regNum = RegExp(r'(\d+)');
  do {
    if (doLoopStep == ProcessStep.chooseMethod) {
      menu();
    } else if (doLoopStep == ProcessStep.inputA) {
      stdout.write('Input first number: ');
    } else if (doLoopStep == ProcessStep.inputB) {
      // stdout.writeln('Input second number');
      stdout.write('Input second number: ');
    }

    final input = stdin.readLineSync();

    //Checks if do loop needs to be exited
    if (input == 'exit') {
      break;

      //Checks if invalid input is used
    } else if (input == null || input == '') {
      stdout.writeln('Invalid input, try again.\n');
      continue;

      //Checks if input is a String
    } else if (regNum.hasMatch(input) == false) {
      stdout.writeln('Please input a number, try again.\n');
      continue;

      //Checks if input is a number
    } else if (regNum.hasMatch(input) == true) {
      //Uses ProcessStep to determine which value to assign
      if (doLoopStep == ProcessStep.chooseMethod && int.parse(input) <= 4) {
        method = int.parse(input);
        doLoopStep = ProcessStep.inputA;
        continue;
      } else if (doLoopStep == ProcessStep.inputA) {
        a = double.parse(input);
        doLoopStep = ProcessStep.inputB;
        continue;
      } else if (doLoopStep == ProcessStep.inputB) {
        b = double.parse(input);
        showAnswer(a!, b!, calculate(method!, a, b), method!);
        a = null;
        b = null;
        method = null;
        doLoopStep = ProcessStep.chooseMethod;
      }
    }
  } while (true);
}
