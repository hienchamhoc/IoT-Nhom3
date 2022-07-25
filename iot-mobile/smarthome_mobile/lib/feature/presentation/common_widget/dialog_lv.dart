import 'package:flutter/material.dart';
import 'package:smarthome_mobile/core/enum/enum_const.dart';
import 'package:smarthome_mobile/core/helper/navigation_screen.dart';
import 'package:smarthome_mobile/feature/presentation/common_widget/button_lv.dart';
import 'package:smarthome_mobile/feature/presentation/common_widget/text_field_lv.dart';

class NavDialog {
  void function(String value) {}

  static dynamic show(
    BuildContext context,
    Widget alertDialog,
  ) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return alertDialog;
        });
  }
}

class AlertDialogLv extends StatelessWidget {
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;

  const AlertDialogLv({Key? key, this.title, this.content, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: title,
      ),
      content: content,
      actions: actions,
      alignment: Alignment.center,
    );
  }
}

class AlertDialogLvUpdate extends StatelessWidget {
  final Widget? title;
  final KeyUsedWord keyUsedWord;
  final TextEditingController textEditingController = TextEditingController();
  final String? contentTextField;

  AlertDialogLvUpdate({
    Key? key,
    this.title,
    required this.keyUsedWord,
    this.contentTextField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textEditingController.text = contentTextField ?? '';

    return AlertDialog(
      title: Center(
        child: title,
      ),
      content: TextFieldLv(
        keyUsedWord: keyUsedWord,
        textEditingController: textEditingController,
      ),
      actions: [
        ButtonLv(
          onPressed: () {
            Nav.back(result: contentTextField);
          },
          keyUsedWord: KeyUsedWord.cancel,
        ),
        ButtonLv(
          onPressed: () {
            Nav.back(result: textEditingController.text);
          },
          keyUsedWord: KeyUsedWord.OK,
        ),
      ],
    );
  }
}

class OptionsAlertDialogLv extends StatelessWidget {
  final VoidCallback? onPressYes;

  const OptionsAlertDialogLv({Key? key, this.onPressYes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialogLv(
      title: const Text('Are u sure, bro? '),
      actions: [
        ButtonLv(
          onPressed: () {
            Nav.back();
          },
          keyUsedWord: KeyUsedWord.cancel,
        ),
        ButtonLv(
          onPressed: onPressYes,
          keyUsedWord: KeyUsedWord.OK,
        ),
      ],
    );
  }
}
