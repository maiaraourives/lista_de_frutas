import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CsTextFormField extends StatelessWidget {
  ///[TextFormField] utilizados no aplicativo
  const CsTextFormField({
    required this.hintText,
    this.onChanged,
    this.validator,
    this.controller,
    this.enabled = true,
    this.forceDisable = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.focus,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.maxLength,
    this.maxLines = 1,
    this.label,
    this.obrigatorio = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.autovalidateMode = AutovalidateMode.always,
    this.filled = true,
    this.fillColor,
    this.onTap,
    this.onSaved,
    this.radius = 10,
    super.key,
  });

  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool enabled;
  final bool forceDisable;
  final bool autocorrect;
  final bool autofocus;
  final bool enableSuggestions;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final String? label;
  final bool obrigatorio;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final AutovalidateMode autovalidateMode;
  final bool filled;
  final Color? fillColor;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final double radius;

  EdgeInsets _definePadding() {
    const double padding = 60;
    const double defaultHorizontal = 10;
    const double defaultTop = 18;
    const double defaultBottom = 18;

    if (suffixIcon != null && prefixIcon != null) {
      return const EdgeInsets.symmetric(horizontal: padding).copyWith(top: defaultTop, bottom: defaultBottom);
    }

    if (suffixIcon != null) {
      return const EdgeInsets.symmetric(horizontal: defaultHorizontal).copyWith(right: padding, top: defaultTop, bottom: defaultBottom);
    }

    if (prefixIcon != null) {
      return const EdgeInsets.symmetric(horizontal: defaultHorizontal).copyWith(left: padding, top: defaultTop, bottom: defaultBottom);
    }

    return const EdgeInsets.symmetric(horizontal: defaultHorizontal).copyWith(top: defaultTop, bottom: defaultBottom);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: forceDisable ? null : onTap,
      child: Stack(
        children: [
          //Utilizado apenas para validação de campos desabilitados
          IgnorePointer(
            ignoring: true,
            child: TextFormField(
              enabled: forceDisable ? false : !enabled,
              validator: (_) => validator != null
                  ? enabled
                      ? null
                      : validator!(controller?.text ?? '')
                  : null,
              maxLength: maxLength,
              maxLines: maxLines,
              autovalidateMode: autovalidateMode,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                counterText: '',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: _definePadding(),
                errorStyle: theme.inputDecorationTheme.errorStyle,
              ),
            ),
          ),

          TextFormField(
            //Campos obrigatórios
            onChanged: onChanged,
            validator: enabled ? validator : null,
            controller: controller,

            //Campos opcionais
            enabled: enabled,
            autocorrect: autocorrect,
            autofocus: autofocus,
            enableSuggestions: enableSuggestions,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            focusNode: focus,
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            maxLines: maxLines,
            scrollPhysics: const BouncingScrollPhysics(),
            textInputAction: textInputAction,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              filled: filled,
              fillColor: fillColor ?? Colors.white,
              counterText: '',
              alignLabelWithHint: false,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hintText,
              errorText: errorText,
              labelStyle: theme.inputDecorationTheme.labelStyle,
              hintStyle: theme.inputDecorationTheme.hintStyle,
              errorStyle: theme.inputDecorationTheme.errorStyle,
              border: theme.inputDecorationTheme.border,
              enabledBorder: theme.inputDecorationTheme.enabledBorder,
              errorBorder: theme.inputDecorationTheme.errorBorder,
              focusedErrorBorder: theme.inputDecorationTheme.focusedErrorBorder,
              focusedBorder: theme.inputDecorationTheme.focusedBorder,
              disabledBorder: theme.inputDecorationTheme.disabledBorder,
              contentPadding: _definePadding(),
              enabled: enabled,
            ),
            style: theme.textTheme.labelMedium,
          ),

          ///Define a posição do ícone que será exibida no [TextField], se possuir
          if (prefixIcon != null) ...[
            Positioned(
              top: 6,
              bottom: 0,
              left: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: prefixIcon!,
              ),
            ),
          ],

          ///Define a posição do ícone que será exibida no [TextField], se possuir
          if (suffixIcon != null) ...[
            Positioned(
              top: 6,
              bottom: 0,
              right: 5,
              child: Align(
                alignment: Alignment.topRight,
                child: suffixIcon!,
              ),
            ),
          ],

          if (forceDisable) ...[
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.5),
              ),
            )
          ],
        ],
      ),
    );
  }
}