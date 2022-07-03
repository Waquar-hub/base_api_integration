import 'package:base_api_integration/helper/dialoge_helper.dart';
import 'package:base_api_integration/services/exceptions.dart';

class BaseController {
  void handleException(error) {
    hideLoading();
    if (error is BadRequestException) {
      //Show Dialoge
      var message = error.message;
      DialogHelper.showErrorDialog(
        description: message.toString(),
      );
    } else if (error is UnAuthorisedException) {
      var message = error.message;
      DialogHelper.showErrorDialog(
        description: message.toString(),
      );
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(
        description: message.toString(),
      );
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
        description: 'Oops! It took longer to respond.',
      );
    }
  }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
