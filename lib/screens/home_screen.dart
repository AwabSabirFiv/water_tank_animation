import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:task/screens/popups/bottom_sheet_ask_operation.dart';
import 'package:task/screens/popups/custom_water_popup.dart';
import 'package:task/screens/popups/remove_water_popup.dart';
import 'package:task/utils.dart';
import 'package:task/widgets/full_width_dialog.dart';

import '../controller/controller.dart';
enum Unit { Oz, ml }
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var unit = Unit.ml.obs;
  late  homeScreenController controller= Get.put(homeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         showFullWidthDialog(context, BottomAsk(addWater:addWater,
           removeWater:removeWater ,), false, DialogType.bottomSheet, heightFactor: 0.2);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: getBody(MediaQuery.of(context).size),
      ),
    );
  }

  Widget getBody(Size size) {
    return SingleChildScrollView(
      child: Obx(()=> Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Water Tracker", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              DropdownButton(
                value: unit.value,
                items: const [
                  DropdownMenuItem(
                    child: Text("ml"),
                    value: Unit.ml,
                  ),
                  DropdownMenuItem(
                    child: Text("Oz"),
                    value: Unit.Oz,
                  ),
                ],
                onChanged: (value) {
                  unit.value = value as Unit;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.height /2,
            child: LiquidCircularProgressIndicator(
              value: controller.waterIntake.value,
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              backgroundColor: Colors.white,
              borderColor: Colors.black,
              borderWidth: 5.0,
              direction: Axis.vertical,
              center:  Text("${getWaterPercentage()}%", style: const TextStyle(
                fontSize: 20,
              ),),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            runSpacing: 20,
            spacing: 10,
            children: List.generate(unit.value== Unit.ml? mlDisplay.length:ozDisplay.length, (index) {
              return  ElevatedButton(
                onPressed: () {
                  if(unit.value== Unit.ml) {
                    var amount = mlDisplay[index]['amount'];
                    controller.addWater(controller.convertToNormalizedValue(amount));
                  } else {
                    double amount = ozDisplay[index]['amount'];
                    controller.addWater(controller.convertToNormalizedValue(amount.ozToMl.toInt()));
                  }
                },
                child:  Text("${unit.value== Unit.ml? mlDisplay[index]['name']:ozDisplay[index]['name']}", style: const TextStyle(
                  fontSize: 20,
                ),),
              );
            }),
          ),
        ],
      )),
    );
  }




  int getWaterPercentage() {
    return (controller.waterIntake.value * 100).toInt();
  }

  void addWater() {
    Get.back();
    showFullWidthDialog(context, CustomAddWater(), false, DialogType.dialog);
  }

  void removeWater() {
    Get.back();
    showFullWidthDialog(context, RemoveWater(), false, DialogType.dialog);
  }



}
