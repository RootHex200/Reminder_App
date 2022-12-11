import 'package:flutter/material.dart';

class DateTimeView extends StatelessWidget {
  const DateTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    var date = "${DateTime.now()}".split(" ")[0];
    print(date);
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Tue",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    Text(
                      "12",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
