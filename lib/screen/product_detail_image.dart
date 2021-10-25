import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

class ProductDetailImage extends StatefulWidget {
  int productId;
  ProductDetailImage({required this.productId});
  @override
  _ProductDetailImageState createState() => _ProductDetailImageState();
}

class _ProductDetailImageState extends State<ProductDetailImage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,maxHeight: 1024,maxWidth: 1024);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,maxHeight: 1024,maxWidth: 1024);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  bool loading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'แก้ไขรูปภาพ',
          style: kAppbarTextStyle,
        ),
        backgroundColor: deepOrange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null ?
              Container(
                width: screenWidth-60,
                height: screenHeight*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade400,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Icon(Icons.photo_size_select_actual),
                    Text("เลือกรูปภาพ"),
                  ],
                ),
              ):
              Container(
                width: screenWidth-60,
                height: screenWidth*0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(_image!),
                  ),
                ),
              ),
              SizedBox(height: screenHeight*0.01,),
              PintoButton(
                function: getImageFromGallery,
                label: 'คลังรูปภาพ',
                buttonColor: lightOrange,
              ),
              SizedBox(height: screenHeight*0.01,),
              PintoButton(
                function: getImageFromCamera,
                label: 'ถ่ายภาพ',
                buttonColor: lightOrange,
              ),
              SizedBox(height: screenHeight*0.02,),
              PintoButton(
                function: () async {
                  try{
                    await ProductService.updateProductImg(widget.productId,_image!);
                    Navigator.pop(context);
                  }catch(err){
                    error = err.toString();
                    print(error);
                  }
                },
                label: 'บันทึก',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
