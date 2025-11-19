import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  String title;
  IconData? icon;
  bool isObsecured;
  VoidCallback? onTap;
  TextEditingController textEditingController;
  String? Function(String?)? validator;
  TextInputType textInputType;

  AppFormField({
    super.key,
    required this.title,
    this.icon,
    this.isObsecured = false,
    this.onTap = null,
    required this.textEditingController,
    this.validator,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      validator: validator,
      controller: textEditingController,
      obscureText: isObsecured,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey, width: 1.4),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.8),
            width: 2,
          ),
        ),
        label: Text(title),
        suffixIcon: GestureDetector(onTap: onTap, child: Icon(icon, size: 16)),
      ),
    );
  }
}
