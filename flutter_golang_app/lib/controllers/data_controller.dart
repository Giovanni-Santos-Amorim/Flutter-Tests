import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_golang_app/const/app_constants.dart';
import 'package:flutter_golang_app/services/services.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  DataService service = DataService();

  bool _isloading = false;
  bool get isloading => _isloading;

  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;

  Future<void> getData() async {
    _isloading = true;

    Response response = await service.getData(AppConstants.GET_TASKS);

    if(response.statusCode == 200){
      _myData = response.body;
      print('we got the data');
      update();
    }
    else{
      print('we did not get any data');
    }
    _isloading = false;
  }

  Future<void> getSingleData(String id) async {
    _isloading = true;

    Response response = await service.getData('${AppConstants.GET_TASK}''$id');

    if (response.statusCode == 200) {
      if(kDebugMode){
        print('we got the single data ' + jsonEncode(response.body));

        _singleData = response.body;
      }
      update();
    }
    else {
      print('we did not get any data');
    }
    _isloading = false;
  }

  Future<void> postData(String task, String taskDetail) async {
    _isloading = true;

    Response response = await service.postData(AppConstants.POST_TASK,{
      'task_name' : task,
      'task_detail' : taskDetail
    });

    if(response.statusCode == 200){

      print('data post sucessfull');
      update();
    }
    else{
      print('we did not get any data');
    }

  }

  Future<void> updateData(String task, String taskDetail, int id) async {
    _isloading = true;

    Response response = await service.updateData('${AppConstants.UPDATE_TASK}''$id',{
      'task_name' : task,
      'task_detail' : taskDetail
    });

    if(response.statusCode == 200){

      print('data updated');
      update();
    }
    else{
      print('not updated');
    }

  }

  Future<void> deleteData(int id) async {
    _isloading = true;

    Response response = await service.deleteData('${AppConstants.DELETE_TASK}''?id=$id');

    if(response.statusCode == 200){

      print('data deleted');
      update();
    }
    else{
      print('not deleted');
    }

  }
}