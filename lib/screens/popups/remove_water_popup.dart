import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils.dart';

import '../../controller/controller.dart';

class RemoveWater extends StatelessWidget {
  RemoveWater({Key? key}) : super(key: key);
  var groupValue = 1.obs;
  late homeScreenController controller = Get.find();
  late TextEditingController tfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          const Text("Remove Water", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
          TextField(
            controller: tfController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter amount",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() =>  Row(
            children: [
              const Text("ml"),
              Radio(
                value: 1,
                groupValue: groupValue.value,
                onChanged: (value) {
                  groupValue.value = value as int;
                },
              ),
              const Text("Oz"),
              Radio(
                value: 2,
                groupValue: groupValue.value,
                onChanged: (value) {
                  groupValue.value = value as int;
                },
              ),
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: () {
                  switch(groupValue.value){
                    case 1:
                      if(tfController.text.isNotEmpty) {
                        removeCustomWater(controller.convertToNormalizedValue(int.parse(tfController.text)));
                      }
                      break;
                    case 2:
                      if(tfController.text.isNotEmpty) {
                        removeCustomWater(controller.convertToNormalizedValue(int.parse(tfController.text)).ozToMl);
                      }
                      break;
                  }
                },
                child: const Text("Remove"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void removeCustomWater(double value){
    if(value>0){  // if value is negative
      controller.removeWater(value);
      Get.back();
    }

  }
}
