import 'package:carparking/util/color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  showSuccessMessage(msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: successColor);
  }

  showErrorMessage(msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: errorColor);
  }
}
