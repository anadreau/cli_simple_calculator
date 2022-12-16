import 'dart:io';
import 'package:cli_simple_app/cli_simple_conversion.dart';

enum ConversionSteps { chooseConversion, inputA }

var doLoopStep = ConversionSteps.chooseConversion;
var regNum = RegExp(r'(\d+)');
int? method;
double? a;

//main
void main(List<String> args) {
  do {
    if (doLoopStep == ConversionSteps.chooseConversion) {
      menu();
    } else if (doLoopStep == ConversionSteps.inputA) {
      stdout.write('Input the number to be converted: ');
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
      if (doLoopStep == ConversionSteps.chooseConversion &&
          int.parse(input) <= 6) {
        //Assign input to method
        method = int.parse(input);
        //Progress doLoopStep so loop will assign inputA next iteration
        doLoopStep = ConversionSteps.inputA;
        continue;
      } else if (doLoopStep == ConversionSteps.inputA) {
        //Assign input to a
        a = double.parse(input);
        //Progress doLoopStep so loop will assign inputB next iteration
        stdout.writeln('${conversionCalculation(method!, a!)}');
        doLoopStep = ConversionSteps.chooseConversion;
        a = null;
        method = null;
      }
    }
  } while (true);
}
