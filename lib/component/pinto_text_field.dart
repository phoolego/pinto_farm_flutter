import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';

class PintoTextField extends StatelessWidget {
  String label = '';
  String initValue = '';
  bool isPassword = false;
  var validator;
  var onChanged;

  PintoTextField(
      {required this.label, this.validator, this.onChanged, this.isPassword=false, this.initValue=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: kContentTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: TextFormField(
              decoration: const InputDecoration(
                // hasFloatingPlaceholder: true,
                // hintText: 'gdsagasdg',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              initialValue: initValue,
              obscureText: isPassword,
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}