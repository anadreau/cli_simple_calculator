import 'dart:io';

//Calculates and returns (a *||%||+||- b)
double calculate(int option, double? a, double? b) {
  if (option == 1) {
    return a! * b!;
  } else if (option == 2) {
    return (a! / b!);
  } else if (option == 3) {
    return a! + b!;
  } else if (option == 4) {
    return a! - b!;
  } else {
    return 0;
  }
}

//Graphically prints the answer to the CLI
void showAnswer(double a, double b, double c, int method) {
  String d = '';
  if (method == 1) {
    d = 'X';
  } else if (method == 2) {
    d = '%';
  } else if (method == 3) {
    d = '+';
  } else if (method == 4) {
    d = '-';
  }
  stdout.writeln('\n*****ANSWER*****');
  stdout.writeln('              $a');
  stdout.writeln('           $d  $b');
  stdout.writeln('________________');
  stdout.writeln('              ${c.toStringAsFixed(2)}');
  stdout.writeln('****************');
}

//Displays Menu on CLI
void menu() {
  stdout.writeln('\n******MENU******');
  stdout.writeln('1. Multiply 2 numbers');
  stdout.writeln('2. Divide 2 numbers');
  stdout.writeln('3. Add 2 numbers');
  stdout.writeln('4. Subtract 2 numbers');
  stdout.writeln('Type "exit" at any time to quit.');
  stdout.writeln('****************');
  stdout.write('Input: ');
}
