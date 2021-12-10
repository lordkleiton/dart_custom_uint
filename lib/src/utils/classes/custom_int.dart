import '../bin_to_int.dart';
import 'has_binary.dart';
import 'has_integer.dart';
import 'has_twos_complement.dart';
import 'custom_base.dart';

class CustomInt extends CustomIntBase
    implements HasInteger, HasBinary, HasTwosComplement {
  late List<bool> _list;

  bool get negative => _list[0] == BinToIntUtils.negative;

  bool get positive => !negative;

  @override
  String get binary {
    final String signal = negative ? '-' : '';
    final String number =
        _list.sublist(1).fold('', (acc, curr) => '$acc${curr ? 1 : 0}');

    return '$signal$number';
  }

  @override
  int get integer {
    final String number = toString();
    final int result =
        int.parse(number.substring(1), radix: BinToIntUtils.radix);

    return negative ? -result : result;
  }

  @override
  String get twosComplement => BinToIntUtils.intToTwosComplement(integer);

  CustomInt(int number, int width) : super() {
    _list = BinToIntUtils.intToList(number, width);
  }

  @override
  String toString() => binary;
}
