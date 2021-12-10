import 'package:dart_uint/dart_uint.dart';

void main() {
  final int number = 123456789;

  printNumber(number);
  printNumber(-number);
}

void printNumber(int number) {
  print('num $number');
  print('bin ${number.toRadixString(2)}');

  printUnsigned(number);
  printSigned(number);
}

void customPrint(String label, CustomIntBase value) {
  print('[$label - ${value.runtimeType}]');
  print(' bin $value');

  if (value is HasInteger) {
    print(' int ${(value as HasInteger).integer}');
  }

  if (value is HasTwosComplement) {
    print(' 2cp ${(value as HasTwosComplement).twosComplement}');
  }
}

void printUnsigned(int number) {
  var a = UInt8(number);
  var b = UInt16(number);
  var c = UInt32(number);
  var d = UInt64(number);

  print('');
  print('------------ unsigned ------------');
  customPrint('a', a);
  customPrint('b', b);
  customPrint('c', c);
  customPrint('d', d);
}

void printSigned(int number) {
  var a = Int8(number);
  var b = Int16(number);
  var c = Int32(number);
  var d = Int64(number);

  print('');
  print('------------- signed -------------');
  customPrint('a', a);
  customPrint('b', b);
  customPrint('c', c);
  customPrint('d', d);
}
