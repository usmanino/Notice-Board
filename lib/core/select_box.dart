import 'package:flutter/material.dart';
import 'package:noticeboard_system/core/styles.dart';

class SelectBox extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final FormFieldValidator<dynamic>? validator;
  final double radius;
  final dynamic value;
  final bool? isUnderline;
  final String? labelText;
  final Color hitColor;
  final double raduis;
  final Color? textColor;
  final Color? iconColor;
  final double? fontSize;
  final Color fillColor;
  final ValueChanged? onChanged;
  final BorderSide borderSide;
  final IconData? preicon;
  final bool isPrefix;
  SelectBox({
    required this.items,
    this.validator,
    this.radius = 8.0,
    this.labelText,
    this.value,
    this.isUnderline = false,
    this.iconColor = kWhiteColor,
    this.hitColor = kBlackColor,
    this.textColor = kWhiteColor,
    this.fontSize,
    this.raduis = 8,
    this.fillColor = const Color(0xFFF7F8F9),
    this.onChanged,
    this.preicon,
    this.isPrefix = false,
    this.borderSide = BorderSide.none,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: items,
      isExpanded: true,
      validator: validator,
      style: TextStyle(
        color: textColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: hitColor,
        ),
        filled: true,
        fillColor: fillColor,
        labelStyle: const TextStyle(
          color: kSecondaryColor,
        ),
        focusedBorder: isUnderline == false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  raduis,
                ),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kWhiteColor,
                  width: 2,
                ),
              ),
        enabledBorder: isUnderline == false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  raduis,
                ),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.4),
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kWhiteColor,
                  width: 2,
                ),
              ),
        border: isUnderline == false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  raduis,
                ),
                borderSide: borderSide,
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kWhiteColor,
                  width: 2,
                ),
              ),
        contentPadding: const EdgeInsets.only(
          left: 10.0,
          bottom: 12.0,
          top: 12.0,
          right: 10.0,
        ),
        prefixIcon: isPrefix
            ? Icon(
                preicon,
              )
            : null,
      ),
      onChanged: onChanged,
      dropdownColor: isUnderline == false ? kWhiteColor : Colors.transparent,
      iconEnabledColor: kBlackColor,
      icon: Icon(
        Icons.keyboard_arrow_down,
        size: 25.0,
        color: iconColor,
      ),
    );
  }
}
