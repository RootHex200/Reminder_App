import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Row(
          children: [
            // const Icon(
            //   Icons.arrow_back_ios,
            //   size: 25,
            //   color: Colors.black,
            // ),
            Expanded(child: Container()),
            const Text(
              "Task",
              style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
