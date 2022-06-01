import 'package:book_app/class/model/search_model.dart';
import 'package:get/get.dart';

import '../class/service/api_client.dart';

class ApiController extends GetxController {
  final apiClient = ApiClient();
  final isFetching = false.obs;

  SearchResult? result;

  Future<void> getBooks(String querry) async {
    isFetching(true);
    await apiClient.fetchResult(querry).then((value) {
      if (value != null) {
        result = value;
      }
    });
    isFetching(false);
  }
}
