import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  List<String> items = [];
  var onChange;

  DropDownField({required this.items, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextDropdownFormField(
      options: items,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      dropdownHeight: 150,
      onChanged:(dynamic val){
        onChange(val);
      },
    );
  }
}
