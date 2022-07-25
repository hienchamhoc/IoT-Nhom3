import 'package:flutter/cupertino.dart';
import 'package:smarthome_mobile/core/enum/enum_const.dart';
import 'package:smarthome_mobile/feature/presentation/common_widget/text_field_lv.dart';

class NoteField extends StatelessWidget {
  final TextEditingController ecNote;

  NoteField({Key? key, required this.ecNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLv(
      textEditingController: ecNote,
      keyUsedWord: KeyUsedWord.note,
      maxLines: 4,
      maxLength: 100,
    );
  }
}
