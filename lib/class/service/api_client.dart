import 'package:book_app/class/model/search_model.dart';
import 'package:book_app/class/service/api_service.dart';

class ApiClient {
  Future<SearchResult?> fetchResult(String search) async {
    SearchResult? result;
    ApiServic.client.options.headers["Accept"] = "application/json";
    final res = await ApiServic.client.get("/search.json?q=$search");
    if (res.statusCode == 200) {
      result = SearchResult.fromJson(res.data);
      return result;
     
    } else {
      return null;
    }
  }
}
