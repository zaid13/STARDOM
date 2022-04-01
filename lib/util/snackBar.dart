
import 'package:flutter/material.dart';

void showSnackbar(String message,_scaffoldKey) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
}