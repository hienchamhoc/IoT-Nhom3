import 'package:flutter/material.dart';
import 'package:smarthome_mobile/core/constant/color_const.dart';
import 'package:smarthome_mobile/core/constant/error_const.dart';
import 'package:smarthome_mobile/core/enum/enum_const.dart';
import 'package:smarthome_mobile/core/helper/bloc_provider.dart';
import 'package:smarthome_mobile/core/util/language/used_language.dart';
import 'package:smarthome_mobile/feature/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';
import 'package:smarthome_mobile/feature/presentation/global_controllers/user_language_bloc/user_language_state.dart';

class TextFieldLv extends StatelessWidget {
  final TextEditingController textEditingController;
  final KeyUsedWord keyUsedWord;
  final bool? obscureText;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? maxLength;
  final String? countText;
  final bool? enabled;
  final ValueChanged<String>? onChanged;

  const TextFieldLv({
    Key? key,
    required this.textEditingController,
    required this.keyUsedWord,
    this.obscureText,
    this.textInputType,
    this.maxLines,
    this.maxLength,
    this.countText,
    this.enabled,
    this.onChanged,
  }) : super(key: key);

  String _getText(UsedLanguage usedLanguage) {
    return usedLanguage.getTextByLanguage(keyUsedWord);
  }

  void dispose() {
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserLanguageBloc? userLanguageBloc = BlocProvider.of(context);

    return StreamBuilder<RemoteState>(
      initialData: userLanguageBloc?.state,
      stream: userLanguageBloc?.stateController.stream,
      builder: (BuildContext context, AsyncSnapshot<RemoteState> snapshot) {
        if (snapshot.hasData) {
          return TextField(
            controller: textEditingController,
            obscureText: obscureText ?? false,
            keyboardType: textInputType ?? TextInputType.text,
            maxLines: maxLines,
            maxLength: maxLength,
            enabled: enabled ?? true,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              hintText: _getText(snapshot.data!.usedLanguage),
              fillColor: ColorConst.medialColorConst.white,
              counterText: countText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          );
        } else {
          return const Text(ErrorConst.nullStream);
        }
      },
    );
  }
}
