import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  List<TextEditingController> controllerList =[];
  List<String> valueList =[];

  late String value;

  void addWidget() {
    controllerList.add(TextEditingController());
    update();
  }
  
  void allValue(){
    valueList.clear();
    for(int i = 0; i<controllerList.length; i++){
      valueList.add(controllerList[i].text);
    }
   value = valueList.join();
    update();
    print(value);
    Get.snackbar("Value", value);
  }


  void removeValue(index){
    controllerList[index].clear();
    controllerList[index].dispose();
    controllerList.removeAt(index);
    update();
  }
}
