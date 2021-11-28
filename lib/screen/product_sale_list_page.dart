import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/drop_down.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/component/status_card.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/model/stock_product.dart';
import 'package:pinto_farmer_flutter/screen/add_sell_product.dart';
import 'package:pinto_farmer_flutter/screen/product_sale_status_page.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

class ProductSaleList extends StatefulWidget {
  Product product;
  ProductSaleList({Key? key, required this.product}) : super(key: key);

  @override
  _ProductSaleListState createState() => _ProductSaleListState();
}

class _ProductSaleListState extends State<ProductSaleList> {
  String status='ทั้งหมด';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: const Text(
          'รายการที่ส่งขาย',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 40),
                          alignment: Alignment.centerLeft,
                          height: 60,
                          color: lightOrange,
                          child: Text(
                            '${widget.product.typeOfProduct}',
                            style: kHeadingTextStyle,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.9 * screenWidth,
                      height: 60,
                      child: DropDown.sendStockProduct(
                        (String? val){
                          setState(() {
                            status=val!;
                          });
                        }
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PintoButton(
                        width: 150,
                        label: '+ เพิ่มรายการ',
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddSellProductPage(product: widget.product))
                          );
                        },
                        buttonColor: lightGrayBackground),
                    SizedBox(
                      width: 0.05 * screenWidth,
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    0.05 * screenWidth, 0.005 * screenHeight, 0.05 * screenWidth, 0),
                child: FutureBuilder<List<StockProduct>>(
                  future: ProductService.getStockProduct(widget.product.productId),
                  builder: (BuildContext context, AsyncSnapshot<List<StockProduct>> snapshot) {
                    if(!snapshot.hasData){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString())
                      );
                    }else{
                      List<StockProduct> stockProducts = snapshot.data!;
                      stockProducts = stockProducts.where((e) =>status=='ทั้งหมด'|| e.getStatus()==status).toList();
                      return ListView.builder(
                        itemCount: stockProducts.length,
                        itemBuilder: (context, index)=> StatusCard(
                          stockProduct: stockProducts[index],
                          function: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductSaleStatusPage(stockProduct: stockProducts[index]))
                            );
                          }
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: 20),
              width: screenWidth,
              color: deepOrange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ปริมาณที่ขายได้ทั้งหมด ${widget.product.getUsedAmount()} ${widget.product.unit} ${
                      widget.product.status=='PLANTING'?'จากการคาดการ':'จากการเก็บเกี่ยว'}',style: kNormalTextStyle,),
                  FutureBuilder<List<StockProduct>>(
                    future: ProductService.getStockProduct(widget.product.productId),
                    builder: (BuildContext context, AsyncSnapshot<List<StockProduct>> snapshot) {
                      if(!snapshot.hasData){
                        return Text('ปริมาณที่ส่งขาย 0 ${widget.product.unit}',style: kNormalTextStyle,);
                      }else if(snapshot.hasError){
                        return Text('ปริมาณที่ส่งขาย - ${widget.product.unit}',style: kNormalTextStyle,);
                      }else{
                        List<StockProduct> stockProducts = snapshot.data!;
                        double totalSell = 0;
                        for(StockProduct p in stockProducts){
                          totalSell+= p.sspAmount;
                        }
                        return Text('ปริมาณที่ส่งขาย $totalSell ${widget.product.unit}',style: kNormalTextStyle);
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
