import 'package:base_api_integration/controller/base_controller.dart';

import '../services/Base_url.dart';

class TestController with BaseController {
  void getData() async {
    showLoading("Loading data....");
    var response = await BaseUrl()
        .get("https://jsonplaceholder.typicode.com", '/todos/1')
        .catchError(handleException);
    if (response == null) return;
    hideLoading();
    print(response);
  }

  void postData() async {
    var request = {'message': 'waquar khan'};
    showLoading("Posting data....");

    var response = await BaseUrl()
        .post("https://jsonplaceholder.typicode.com", "/posts", request)
        .catchError(handleException);
    if (response == null) return;
    hideLoading();

    print(response);
  }
}
