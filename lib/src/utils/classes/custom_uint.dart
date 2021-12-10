import '../bin_to_int.dart';
import 'has_binary.dart';
import 'has_integer.dart';
import 'custom_base.dart';

class CustomUInt extends CustomIntBase implements HasInteger, HasBinary {
  late List<bool> _list;

  @override
  String get binary => _list.fold('', (acc, curr) => '$acc${curr ? 1 : 0}');

  @override
  int get integer => int.parse(binary, radix: BinToIntUtils.radix);

  CustomUInt(int number, int width) : super() {
    _list = BinToIntUtils.uintToList(number, width);
  }

  @override
  String toString() => binary;
}
