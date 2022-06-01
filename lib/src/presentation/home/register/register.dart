import 'package:book_app/logic/register_controller.dart';
import 'package:book_app/src/presentation/home/register/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const routeName = 'registerPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

final controller = Get.put( RegisterController());

  DateTime? birthDate;



  @override
  Widget build(BuildContext context) {
    birthDate != null
        ? controller.datePickerCntrl.value.text =
            "${birthDate?.day} - ${birthDate?.month} - ${birthDate?.year}"
        : "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Enter Details",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: controller.surnameCntrl.value,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty || value.trim() == "") {
                      return "Please enter your surname!";
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Enter your surname",
                  ),
                ),
                const SizedBox(height: 18.0),
                TextFormField(
                  controller: controller.lastnameCntrl.value,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value!.isEmpty || value.trim() == "") {
                      return "Please enter your last name!";
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Enter your last name",
                  ),
                ),
                const SizedBox(height: 18.0),
                const Divider(thickness: 1),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailCntrl.value,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || value.trim() == "") {
                      return "Please enter a valid email address!";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Enter your email",
                  ),
                ),
                const SizedBox(height: 18.0),
                const Divider(thickness: 1),
                const Text(
                  "Mobile number",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.numberCntrl.value,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty || value.trim() == "") {
                      return "Please enter a valid mobile number!";
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: "Enter your mobile number",
                  ),
                ),
                const Divider(thickness: 1),
                const Text(
                  "Date of Birth",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.datePickerCntrl.value,
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2050),
                    ).then((value) {
                      setState(() {
                        birthDate = value;
                      });
                    });
                  },
                  keyboardType: TextInputType.none,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty || value.trim() == "") {
                      return "Please enter a valid D.O.B!";
                    } else {
                      return null;
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "DD - MM - YY",
                    prefixIcon: const Icon(Icons.calendar_month_outlined),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const Text(
                  "Gender",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Choose gender";
                      } else {
                        return null;
                      }
                    },
                    value: controller.genderVal.value,
                    isDense: true,
                    onChanged: ((value) => controller.genderVal.value = value!),
                    items: controller.gender.map((e) {
                      return DropdownMenuItem<String>(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: save,
                    child: const Text("Save"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void save() {
    if (_formKey.currentState!.validate()) {
      Navigator.restorablePushNamed(context, DetailsPage.routeName);
    }
  }
}
