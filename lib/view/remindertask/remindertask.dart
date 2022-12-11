import 'package:flutter/material.dart';
import 'package:work_manager/view/homepage/home_page.dart';

class ReminderTask extends StatelessWidget {
  const ReminderTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282829),
      appBar: AppBar(
        backgroundColor: const Color(0xFF282829),
        centerTitle: true,
        title: const Text(
          "Reminder",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Hello,Sabitur",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "You have a new reminder",
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: (MediaQuery.of(context).size.height / 2) + 50,
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 2) +
                    70,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Column(
                     mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.abc,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Title",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "YOur title",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
//descripting
                      Row(
                        children: const [
                          Icon(
                            Icons.task,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "YOur Descripting kadjfkajf lorem ipus hello i am sabitur",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      //Date
                      Row(
                        children: const [
                          Icon(
                            Icons.calendar_month,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Date",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        "9:07",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
