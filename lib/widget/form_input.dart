// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final String hintText;
  final String textValidator;
  final TextEditingController? controller;
  const FormInput(
      {Key? key,
      required this.textValidator,
      required this.label,
      required this.hintText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        initialValue: null,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return textValidator;
          }
          return null;
        },
      ),
    );
  }
}
