abstract class BinToIntUtils {
  static const String one = '1';
  static const String zero = '0';
  static const int radix = 2;
  static const bool negative = true;
  static const bool positive = false;

  static String sanitize(String str) => str.replaceAll(RegExp(r'([^0-1])'), '');

  static String intToBin(int number) => sanitize(number.toRadixString(radix));

  static String intToTwosComplement(int number) {
    final String bin = intToBin(number);

    if (number >= 0) return bin;

    bool firstSet = false;
    String result = "";

    for (int i = bin.length - 1; i >= 0; i--) {
      String curr = bin[i];
      String value = !firstSet
          ? curr
          : curr == one
              ? zero
              : one;

      result = value + result;

      if (!firstSet && value == one) firstSet = true;
    }

    return one + result;
  }

  static String padBin(String bin, int length, bool signed) {
    String result;

    if (signed) {
      final int newLength = length - 1;

      result = bin.substring(
          bin.length < newLength ? 0 : bin.length - newLength, bin.length);
    } else {
      result = bin.substring(
          bin.length < length ? 0 : bin.length - length, bin.length);
    }

    return result.padLeft(length, zero);
  }

  static List<bool> fillList(String bin) {
    final List<bool> result = [];

    for (int i = 0; i < bin.length; i++) {
      result.add(bin[i] != zero);
    }

    return result;
  }

  static List<bool> uintToList(int number, int length) {
    final String bin = intToBin(number);
    final String padded = padBin(bin, length, false);
    final List<bool> result = fillList(padded);

    return result;
  }

  static List<bool> intToList(int number, int length) {
    final String bin = intToBin(number);
    final String padded = padBin(bin, length, true);
    final List<bool> result = fillList(padded);

    result[0] = number > 0 ? positive : negative;

    return result;
  }
}
