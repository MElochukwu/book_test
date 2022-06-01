import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final gender = <String>["Male", "Female", "Other"];
  final genderVal = "Male".obs;
  final datePickerCntrl = TextEditingController().obs;
  final surnameCntrl = TextEditingController().obs;
  final lastnameCntrl = TextEditingController().obs;
  final emailCntrl = TextEditingController().obs;
  final numberCntrl = TextEditingController().obs;
}
