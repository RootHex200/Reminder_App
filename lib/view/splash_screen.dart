import 'package:flutter/material.dart';
import 'package:work_manager/view/homepage/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomePage()));
    });

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {},
              child: const Image(
                  height: 100,
                  width: 100,
                  image:
                      AssetImage("assets/images/YR.png")),
            ),
            Expanded(child: Container()),
            Column(
              children: [
                const Text(
                  "Build Version",
                  style: TextStyle(color: Colors.black54),
                ),
                const Text(
                  "v1.11.1",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}
