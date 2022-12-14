

import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Error!!!!",style: TextStyle(color: Colors.black,fontSize: 19),),
          SizedBox(height: 20,),
          Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}