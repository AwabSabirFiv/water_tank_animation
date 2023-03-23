import 'package:get/get.dart';
class homeScreenController extends GetxController {
  var waterIntake = 0.0.obs;
  double convertToNormalizedValue(int value) {
    const minValue = 100;
    const maxValue = 1000;
    return (value - minValue) / (maxValue - minValue);
  }
  void removeWater(double amount) {
    if(waterIntake.value - amount >= 0) {
      waterIntake.value -= amount;
    }
  }

  void addWater(double amount) {
    if(waterIntake.value + amount <= 1.0) {
      waterIntake.value += amount;
    }

  }
}