import 'utils/classes/custom_int.dart';
import 'utils/classes/custom_uint.dart';

/* utils */

export 'utils/classes/custom_base.dart';
export 'utils/classes/has_binary.dart';
export 'utils/classes/has_integer.dart';
export 'utils/classes/has_twos_complement.dart';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

/* int */

class Int8 extends CustomInt {
  Int8(int number) : super(number, 8);
}

class Int16 extends CustomInt {
  Int16(int number) : super(number, 16);
}

class Int32 extends CustomInt {
  Int32(int number) : super(number, 32);
}

class Int64 extends CustomInt {
  Int64(int number) : super(number, 64);
}

/* uint */

class UInt8 extends CustomUInt {
  UInt8(int number) : super(number, 8);
}

class UInt16 extends CustomUInt {
  UInt16(int number) : super(number, 16);
}

class UInt32 extends CustomUInt {
  UInt32(int number) : super(number, 32);
}

class UInt64 extends CustomUInt {
  UInt64(int number) : super(number, 64);
}
