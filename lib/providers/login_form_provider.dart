import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return loginFormKey.currentState?.validate() ?? false;
  }
}
