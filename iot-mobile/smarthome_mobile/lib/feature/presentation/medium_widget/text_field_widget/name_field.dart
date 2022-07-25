import 'package:flutter/cupertino.dart';
import 'package:smarthome_mobile/core/enum/enum_const.dart';
import 'package:smarthome_mobile/feature/presentation/common_widget/text_field_lv.dart';

class NameField extends StatelessWidget {
  final TextEditingController ecName;

  const NameField({Key? key, required this.ecName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      keyUsedWord: KeyUsedWord.name,
      textEditingController: ecName,
      maxLength: 50,
      countText: '',
    );
  }
}
