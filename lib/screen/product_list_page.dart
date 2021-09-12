import 'package:flutter/material.dart';
import 'package:pinto_flutter/constant.dart';

class productListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'รายการผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'สวัสดี,',
                  style: kHeadingTextStyle,
                  textAlign: TextAlign.left,
                ),
                Text('ฟาร์ม สมหญิง', style: kHeadingTextStyle)
              ],
            ),
          ),
          //not align left
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ))),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: FlatButton(
                  onPressed: () {
                    print('tap!');
                  },
                  color: Colors.amber,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [Icon(Icons.add), Text('เพิ่ม', style: kHeadingTextStyle,)],
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Text('A card that can be tapped'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
