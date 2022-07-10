import 'package:flutter_golang_app/services/services.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  DataService service = DataService();
  bool _isloading = false;
  bool get isloading => _isloading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    _isloading = true;

    Response response = await service.getData();

    if(response.statusCode == 200){
      _myData = response.body;
      print('we got the data');
      update();
    }
    else{
      print('we did not get any data');
    }
  }
}