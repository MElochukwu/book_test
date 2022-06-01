import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../../../logic/api_controller.dart';
import 'book_result.dart';

class SearchBookPage extends StatelessWidget {
  SearchBookPage({Key? key}) : super(key: key);

  static const routeName = "searchBookPage";

  final contrl = TextEditingController();

  final controller = Get.put(ApiController());

  Future<void> searchBooks() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await controller.getBooks(contrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          controller: contrl,
          onEditingComplete: searchBooks,
          textInputAction: TextInputAction.search,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search book by name or author",
            border: InputBorder.none,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Obx(
            () => controller.isFetching.value
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  )
                : controller.result == null
                    ? const SizedBox()
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.result?.docs?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          return BookResultWidget(
                            result: controller.result!.docs![index],
                          );
                        },
                      ),
          ),
        ),
      ),
    );
  }
}
