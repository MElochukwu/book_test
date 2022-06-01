import 'package:book_app/logic/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends GetView<RegisterController> {
  DetailsPage({Key? key}) : super(key: key);

  static const routeName = "detailsPage";

  final details = [
    "Surname",
    "Last name",
    "Email",
    "Mobile number",
    "Date of birth",
    "gender",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              controller.surnameCntrl.value.text,
              style: const TextStyle(fontSize: 17.0),
            ),
            subtitle: const Text("Surname"),
          ),
          ListTile(
             leading: const Icon(Icons.person),
            title: Text(
              controller.lastnameCntrl.value.text,
              style: const TextStyle(fontSize: 17.0),
            ),
            subtitle: const Text("Last name"),
          ),
          ListTile(
             leading: const Icon(Icons.mail),
            title: Text(
              controller.emailCntrl.value.text,
              style: const TextStyle(fontSize: 17.0),
            ),
            subtitle: const Text("Email"),
          ),
          ListTile(
             leading: const Icon(Icons.phone),
            title: Text(
              controller.numberCntrl.value.text,
              style: const TextStyle(fontSize: 17.0),
            ),
            subtitle: const Text("Mobile number"),
          ),
           ListTile(
              leading: const Icon(Icons.calendar_month),
            title: Text(
              controller.datePickerCntrl.value.text,
              style: const TextStyle(fontSize: 17.0),
            ),
            subtitle: const Text("Dirth of birth"),
          ),
           ListTile(
              leading: const Icon(Icons.person),
            title: Text(
              controller.genderVal.value,
              style: const TextStyle(fontSize: 17.0),
            ),
            subtitle: const Text("Gender"),
          ),
        ],
      ),
    );
  }

  Widget child() {
    final value = "".obs;
    for (var i = 0; i > details.length; i++) {
      switch (i) {
        case 0:
          value.value = controller.surnameCntrl.value.text;
          break;
        case 1:
          value.value = controller.lastnameCntrl.value.text;
          break;
        case 2:
          value.value = controller.emailCntrl.value.text;
          break;
        case 3:
          value.value = controller.numberCntrl.value.text;
          break;
        case 4:
          value.value = controller.datePickerCntrl.value.text;
          break;
        case 5:
          value.value = controller.genderVal.value;
          break;
      }
    }
    final widget = Obx(
      () => Text(
        value.value,
        style: const TextStyle(fontSize: 17.0),
      ),
    );
    return widget;
  }
}
