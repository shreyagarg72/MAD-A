import 'dart:math';

class doMath {
  static double sqrt(double number) {
    return sqrt(number);
  }

  static int factorial(int number) {
    if (number < 0) {
      throw ArgumentError('Factorial is not defined for negative numbers');
    }
    if (number == 0) {
      return 1;
    }
    return number * factorial(number - 1);
  }

  static double power(double base, int exponent) {
    return pow(base, exponent).toDouble();
  }
}

void main() {
  // Using static methods without creating an instance
  print(doMath.sqrt(16)); // Output: 4.0
  print(doMath.factorial(5)); // Output: 120
  print(doMath.power(2, 3)); // Output: 8.0
}