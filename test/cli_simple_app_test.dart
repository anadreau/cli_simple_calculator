import 'package:cli_simple_app/cli_simple_app.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(1, 5, 5), 25);
  });
}
