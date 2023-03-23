import 'package:dynamic_field/screen/home_screen/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Dynamic Field"),
            ),
            body: ListView.builder(
                itemCount: controller.controllerList.length,
                itemBuilder: (context,index){
                  return Container(
                      height: 80,
                      margin: EdgeInsets.only(top: 5, left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orangeAccent[100],
                      ),
                      child: Center(
                          child: ListTile(
                            title: TextField(
                              controller: controller.controllerList[index],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Email",
                              ),
                            ),
                            trailing: Column(
                              children: [
                                InkWell(
                                    onTap: (){
                                      print(controller.controllerList[index].text);
                                    },
                                    child: const Icon(Icons.play_circle)),

                                InkWell(
                                    onTap: (){
                                      controller.removeValue(index);
                                    },
                                    child: const Icon(Icons.cancel))
                              ],
                            ),
                          )));;
                }),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    controller.addWidget();
                  },
                ),FloatingActionButton(
                  child: Text("All"),
                  onPressed: () {
                    controller.allValue();
                  },
                ),
              ],
            ),
          );
        });
  }
}


