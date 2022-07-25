import 'package:smarthome_mobile/core/constant/error_const.dart';
import 'package:smarthome_mobile/core/enum/enum_const.dart';

class UsedLanguage {
  final Map<KeyUsedWord, String> listUsedWords = {};

  String getTextByLanguage(KeyUsedWord keyUsedWord) {
    Map<KeyUsedWord, String> map = listUsedWords;
    if (listUsedWords.isEmpty) {
      return ErrorConst.empty;
    }
    String value = map.entries
        .firstWhere(
            (element) => element.key.toString() == keyUsedWord.toString())
        .value;
    return value;
  }
}
