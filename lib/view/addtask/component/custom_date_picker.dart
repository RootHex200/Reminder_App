

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/controller/error_handler.dart';

class CustomDataPicker extends StatefulWidget {
  final TextEditingController startController;
  final ValueChanged<String>? onChanged;
  const CustomDataPicker(
      {super.key, required this.startController, required this.onChanged});

  @override
  State<CustomDataPicker> createState() => _CustomDataPickerState();
}

class _CustomDataPickerState extends State<CustomDataPicker> {
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    print("didponse called");
    super.dispose();
  }

  List format = ["AM", "PM"];
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.startController,
        showCursor: false,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: Consumer(
                    builder: (context, ref, child) {
                      final error = ref.watch(errorProvider);
                      return Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      );
                    },
                  )),
                  content: SizedBox(
                    // height: (MediaQuery.of(context).size.height/3)-170,
                    height: 100,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            // color: Colors.grey.withOpacity(0.1),
                            child: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  
                                    controller: _hourController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                    
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                        focusColor:
                                            Colors.grey.withOpacity(0.4),
                                        hoverColor:
                                            Colors.grey.withOpacity(0.4),
                                        fillColor: Colors.grey.withOpacity(0.4),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                const Text("Hour")
                              ],
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                ":",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 70,
                            // color: Colors.grey.withOpacity(0.1),
                            child: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                    controller: _minuteController,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                        focusColor:
                                            Colors.grey.withOpacity(0.4),
                                        hoverColor:
                                            Colors.grey.withOpacity(0.4),
                                        fillColor: Colors.grey.withOpacity(0.4),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                const Text("Minute")
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(format.length, (index) {
                              return Consumer(
                                builder: (context, ref, child) {
                                  final formatindex = ref.watch(formatProvider);
                                  return GestureDetector(
                                    onTap: () {
                                      ref.watch(formatProvider.state).state =
                                          index;
                                    },
                                    child: Container(
                                      color: formatindex == index
                                          ? Colors.blue.withOpacity(0.1)
                                          : Colors.grey.withOpacity(0.1),
                                      margin: EdgeInsets.only(
                                          bottom: 5, top: index == 0 ? 12 : 4),
                                      child: Text(
                                        format[index],
                                        style: TextStyle(
                                            color: formatindex == index
                                                ? Colors.blue
                                                : Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: [
                                        GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cencel',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )),
                    Consumer(
                      builder: (context, ref, child) {
                        final error = ref.watch(errorProvider);
                        final formatindex = ref.watch(formatProvider);
                        return InkWell(
                            onTap: () {
                              if (_hourController.text == "" &&
                                  _minuteController.text == "") {
                                ref.read(errorProvider.state).state +=
                                    "Invalid!!!";
                              } else {
                                if (int.parse(_hourController.text) <= 12 &&
                                    int.parse(_minuteController.text) <= 60) {
                                  // setState(() {
                                  widget.startController.text =
                                      "${_hourController.text}:${_minuteController.text} ${format[formatindex]}";
                                  widget.onChanged
                                      ?.call(widget.startController.text);
                                  Navigator.of(context).pop();
                                  _hourController.text = "";
                                  _minuteController.text = "";
                                  // });
                                } else {
                                  ref.read(errorProvider.state).state +=
                                      "Invalid!!!";
                                }
                              }
                            },
                            child: const Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ));
                      },
                    ),

                  ],
                );
              });
        },
        decoration: InputDecoration(
            suffixIcon: const Icon(CupertinoIcons.clock),
            focusColor: Colors.grey.withOpacity(0.4),
            hoverColor: Colors.grey.withOpacity(0.4),
            fillColor: Colors.grey.withOpacity(0.4),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }
}