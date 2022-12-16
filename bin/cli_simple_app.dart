import 'dart:io';

import 'package:cli_simple_app/cli_simple_app.dart';

//Variables for input 1,2 and the method used in the calculation
double? a;
double? b;
int? method;

//enum to track the where in the loop to assign a,b and method
enum ProcessStep { chooseMethod, inputA, inputB }

var doLoopStep = ProcessStep.chooseMethod;

void main(List<String> arguments) {
  //RegExpression to determin if input is a digit or invalid
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
    //Assign input from menu, first number or second number
    final input = stdin.readLineSync();

    //Checks if do loop needs to be exited, if true -> Exits program
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
        //Assign input to method
        method = int.parse(input);
        //Progress doLoopStep so loop will assign inputA next iteration
        doLoopStep = ProcessStep.inputA;
        continue;
      } else if (doLoopStep == ProcessStep.inputA) {
        //Assign input to a
        a = double.parse(input);
        //Progress doLoopStep so loop will assign inputB next iteration
        doLoopStep = ProcessStep.inputB;
        continue;
      } else if (doLoopStep == ProcessStep.inputB) {
        //Assign input to b
        b = double.parse(input);
        //Takes a, b and method and shows answer to selected method of calculation
        showAnswer(a!, b!, calculate(method!, a, b), method!);
        //Set a, b, and method back to null incase user goes through menu again
        a = null;
        b = null;
        method = null;
        //Reset doLoopStep so loop will assign method next iteration
        doLoopStep = ProcessStep.chooseMethod;
      }
    }
  } while (true);
}
