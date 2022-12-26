import 'package:flutter/material.dart';
import 'package:work_manager/view/homepage/home_page.dart';

class AddTaskAppBar extends StatelessWidget {
  const AddTaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context)=>const HomePage()), (route) => false);
              
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
