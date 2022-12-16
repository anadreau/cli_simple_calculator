import 'dart:io';

void menu() {
  stdout.writeln('\n******Conversion*MENU******');
  stdout.writeln('1. Tablespoons to Teaspoons');
  stdout.writeln('2. Fluid ounce to Tablespoons');
  stdout.writeln('3. Cup to Fluid ounce');
  stdout.writeln('4. Pint to Cups');
  stdout.writeln('5. Quart to Pints');
  stdout.writeln('6. Gallon to Quarts');
  stdout.writeln('Type "exit" at any time to quit.');
  stdout.writeln('******************************');
  stdout.write('Input: ');
}

//Convert based on method chosen
double conversionCalculation(int method, double a) {
  if (method == 1) {
    return a * 3;
  } else if (method == 2) {
    return (a * 2);
  } else if (method == 3) {
    return a * 8;
  } else if (method == 4) {
    return a * 2;
  } else if (method == 5) {
    return a * 2;
  } else if (method == 6) {
    return a * 4;
  } else {
    return 0;
  }
}
