String? validateEmail(String? value) {
  String? _msg;
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value == null || value.isEmpty) {
    _msg = "Email is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid email address";
  }
  return _msg;
}

String? validateUsername(String? value) {
  String? _msg;
  if (value == null || value.trim().isEmpty) {
    _msg = 'Username is required';
  } else if (value.trim().length < 4) {
    _msg = 'Username must be at least 4 characters in length';
  }
  return _msg;
}

String? validatePassword(String? value) {
  String? _msg;
  if (value == null || value.trim().isEmpty) {
    _msg = 'Password is required';
  } else if (value.trim().length < 8) {
    _msg =  'Password must be at least 8 characters in length';
  }
  return _msg;
}
String? validateConfirmPassword(String? value, String? password) {
  String? _msg;
  if (value == null || value.isEmpty) {
    _msg = 'This field is required';
  } else if (value != password) {
    _msg = 'Confirmation password does not match the entered password';
  }
  return _msg;
}