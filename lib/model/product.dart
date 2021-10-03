class Product{
  int productId=0;
  double area=0;
  DateTime plantDate = DateTime.now();
  DateTime predictHarvestDate = DateTime.now();
  DateTime? harvestDate;
  double? harvestAmount;
  double predictAmount=0;
  String typeOfProduct='';
  String status='';
  double buyPrice=0.0;
  String unit = 'กก.';
  String areaUnit = 'ตร.ม.';
  String priceUnit = 'บาท';

  Product(Map<String,dynamic> jsonProduct){
    productId = jsonProduct['product_id'];
    area = jsonProduct['area']+0.0;
    plantDate = DateTime.parse(jsonProduct['plant_date']);
    predictHarvestDate = DateTime.parse(jsonProduct['predict_harvest_date']);
    harvestDate = jsonProduct['harvest_date']==null?null:DateTime.parse(jsonProduct['harvest_date']);
    harvestAmount = jsonProduct['harvest_amount']==null?null:jsonProduct['harvest_amount']+0.0;
    predictAmount = jsonProduct['predict_amount']+0.0;
    typeOfProduct = jsonProduct['type_of_product'];
    status = jsonProduct['status'];
    buyPrice = jsonProduct['price_buy']+0.0;
    unit = jsonProduct['unit'];
  }

  double getusedAmount(){
    if(status=='PLANTING') {
      return predictAmount;
    }
    else if(status=='HARVESTED' && harvestAmount!=null){
      return harvestAmount!;
    }else{
      return 0;
    }
  }
}