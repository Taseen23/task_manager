import 'package:flutter/material.dart';
import 'package:task_manager/src/homepagecontroller.dart';
import 'package:task_manager/style/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Manager",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColor().appBlue,
      ),
      body: ListView.builder(
        itemCount: controller.taskList.length,
        itemBuilder: (ctx, index) {
          return InkWell(
              onLongPress: () {
                setState(() {
                  controller.markCheck(index);
                });
              },
              child: ExpansionTile(
                leading: Image.asset(
                  "assets/Group.jpg",
                  height: 30,
                  width: 30,
                ),
                title: Row(
                  children: [
                    Text(controller.taskList[index].taskName),
                    const SizedBox(
                      width: 20,
                    ),
                    controller.taskList[index].isComplete
                        ? Image.asset(
                            "assets/Vector.jpg",
                            height: 20,
                            width: 20,
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          controller.taskList[index].taskDetails,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15, color: AppColor().appBlue),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  backgroundColor: AppColor().appBlue,
                  title: const Text(
                    "Add new task",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextFormField(
                      style: TextStyle(color: AppColor().appDeepBlue),
                      controller: controller.taskTitleContoller,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        label: Text(
                          "Task Title",
                          style: TextStyle(color: Colors.white),
                        ),
                        labelStyle: TextStyle(
                          color:
                              Colors.white, // Set the label text color to red
                        ),
                        hintText: "Type your task title",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: controller.taskDetailsContoller,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        label: Text(
                          "Task Details",
                          style: TextStyle(color: Colors.white),
                        ),
                        hintText: "Write task details",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            controller.taskInfo();
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Add Task",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor().appBlue),
                        )),
                  ],
                );
              });
        },
        backgroundColor: AppColor().appBlue,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
