class FormatTextToNumber {
  String _formatTextToMoney(String text) {
    int len = text.length;
    if (len <= 3) {
      return text;
    }

    int cnt = 0;
    String ans = "";
    for (int i = len - 1; i >= 0; i--) {
      ans = text[i] + ans;
      cnt++;
      if (cnt == 3) {
        if (i != 0) {
          ans = " " + ans;
        }
        cnt = 0;
      }
    }
    return ans;
  }

  String changeText(String value) {
    String realPart = '';
    String decimalPart = '';

    int index = 0;
    String val = value.replaceAll(' ', '');
    int len = val.length;
    if (len <= 3) {
      return val;
    }

    String decimal = '';
    while (index < len) {
      if (val[index] == '.') {
        decimal += '.';
        break;
      }
      realPart += val[index];
      index++;
    }
    index++;
    while (index < len) {
      decimalPart += val[index];
      index++;
    }
    String x = _formatTextToMoney(decimalPart) == ""
        ? ''
        : _formatTextToMoney(decimalPart);
    decimal = decimal + x;
    return _formatTextToMoney(realPart) + decimal;
  }

  static double formatTextToDouble(String formattedNumber) {
    String num = formattedNumber.replaceAll(' ', '');
    return double.parse(num);
  }
}
