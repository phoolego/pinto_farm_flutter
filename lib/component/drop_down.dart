import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:pinto_farmer_flutter/constant.dart';


class DropDown extends StatelessWidget {

  String? headingLabel = '';
  List<String> ?items = [];
  String ?hintText = '';

  DropDown.withoutAny(){
    headingLabel = 'ตัวกรอง';
    items = [
      "ยังไม่ได้รับเงิน",
      "ยังไม่ส่งผลผลิต",
      "ได้รับเงินแล้ว",
    ];
    hintText = "กรองสถานะรายการ";
  }

  DropDown({this.hintText, this.items, this.headingLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: DropdownSearch<String>(
            mode: Mode.MENU,
            items: items,
            label: headingLabel,
            dropdownSearchBaseStyle: kContentTextStyle,
            hint: hintText,
            popupItemDisabled: (String s) =>
                s.startsWith('I'),
            onChanged: print,
            selectedItem: ""));
  }
}