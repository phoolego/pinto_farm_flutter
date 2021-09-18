class Farmer{
  int userId=0;
  String firstname='';
  String lastname='';
  String email='';
  String address='';
  String contact='';
  String role='';

  int? farmId=0;
  String? farmName='';
  double? farmMaxArea=0.0;

  Farmer(Map<String,dynamic> jsonUser){
    userId = jsonUser['user_id'];
    firstname = jsonUser['firstname'];
    lastname = jsonUser['lastname'];
    email = jsonUser['email'];
    address = jsonUser['address'];
    contact = jsonUser['contact'];
    role = jsonUser['role'];

    farmId = jsonUser['farmer_id'];
    farmName = jsonUser['farm_name'];
    farmMaxArea= jsonUser['max_area']+0.0;
  }
  Farmer.notLogin(){
    userId=0;
    firstname='';
    lastname='';
    email='';
    address='';
    contact='';
    role='';

    farmId=0;
    farmName='';
    farmMaxArea=0.0;
  }
}