import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';

class InputArea extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final IconData? suricon;
  final IconData? preicon;
  final Color? labelColor;
  final IconData? leadingIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? inputType;
  final bool isPassword;
  final double raduis;
  final BorderSide borderSide;
  final Color enablesborderSide;
  final Color focusedborderSide;
  final double? iconSize;
  final bool? isWritable;
  final bool? isDollar;
  final VoidCallback? onIconClick;
  final GestureTapCallback? onTap;
  final Color leadingColor;
  final Color fillColor;
  final Color? textColor;
  final Color suriconColor;
  final Color preiconColor;
  final int? maxLines;
  final int? minLines;
  final bool enablePrefix;
  final bool enableSurfix;
  final bool readonly;
  final double? labelSize;
  final Function(String)? onChanged;
  final bool? isPrefix;
  final bool? isNum;
  final String? value;

  const InputArea(
      {Key? key,
      this.controller,
      this.onTap,
      this.focusNode,
      this.onChanged,
      this.validator,
      this.hintText,
      this.labelColor = kBlackColor,
      this.labelText,
      this.labelSize,
      this.textColor = kWhiteColor,
      this.suricon,
      this.preicon,
      this.readonly = false,
      this.leadingIcon,
      this.leadingColor = kPrimaryTextColor,
      this.fillColor = const Color(0xFFF7F8F9),
      this.maxLength,
      this.minLines,
      this.preiconColor = kPrimaryColor,
      this.suriconColor = kPrimaryColor,
      this.maxLines = 6,
      this.inputFormat,
      this.inputType,
      this.isPrefix = false,
      this.isPassword = false,
      this.raduis = 8.0,
      this.value,
      this.focusedborderSide = kPrimaryBorder,
      this.enablesborderSide = Colors.grey,
      this.borderSide = BorderSide.none,
      this.iconSize = 24.0,
      this.isWritable = true,
      this.enablePrefix = false,
      this.enableSurfix = false,
      this.isNum = false,
      this.isDollar = false,
      this.onIconClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      minLines: minLines,
      focusNode: focusNode,
      onChanged: onChanged,
      readOnly: readonly,
      initialValue: value,
      onTap: onTap,
      enableInteractiveSelection: true,
      enabled: isWritable,
      validator: validator,
      inputFormatters: inputFormat,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      maxLength: maxLength,
      obscureText: isPassword,
      style: TextStyle(
        color: textColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: labelSize,
          color: Colors.black,
        ),
        hintText: hintText,
        labelStyle: TextStyle(
          color: labelColor,
        ),
        counterText: '',
        fillColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: borderSide,
        ),
        contentPadding: const EdgeInsets.all(
          15.0,
        ),
        prefixIcon: enablePrefix
            ? Padding(
                padding: const EdgeInsets.only(),
                child: GestureDetector(
                  onTap: onIconClick,
                  child: isNum != true
                      ? Icon(
                          preicon,
                          color: kPrimaryColor,
                          size: iconSize,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 13, left: 5),
                          child: Text(
                            '+234',
                            style: GoogleFonts.lato(
                              color: preiconColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
              )
            : null,
        suffixIcon: enableSurfix
            ? Padding(
                padding: const EdgeInsets.only(),
                child: GestureDetector(
                  onTap: onIconClick,
                  child: isDollar != true
                      ? Icon(
                          suricon,
                          color: suriconColor,
                          size: iconSize,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 13, left: 5),
                          child: Text(
                            'USD',
                            style: GoogleFonts.lato(
                              color: kPrimaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                ),
              )
            : null,
      ),
    );
  }
}
