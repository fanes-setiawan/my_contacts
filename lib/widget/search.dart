// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const Search({Key? key, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 6.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey[500],
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: null,
              decoration: InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "enter the contact name",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                hoverColor: Colors.transparent,
              ),
              onFieldSubmitted: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
