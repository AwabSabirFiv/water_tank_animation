import 'package:flutter/material.dart';

class BottomAsk extends StatelessWidget {
   BottomAsk({Key? key, required this.addWater, required this.removeWater}) : super(key: key);
   VoidCallback addWater;
    VoidCallback removeWater;
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
         ListTile(
            onTap: addWater,
            leading: const Icon(Icons.add),
            title: const Text("Add Water"),
          ),
            const SizedBox(
              height: 10,),
            ListTile(
              onTap: removeWater,
              leading: const Icon(Icons.remove),
              title: const Text("Remove Water"),
         )
        ],
      ),
    );
  }
}
