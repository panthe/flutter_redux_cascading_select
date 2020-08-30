// Packages
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShowError {
  final int errorCode;
  final String errorDescription;


  ShowError({
    @required this.errorCode,
    @required this.errorDescription,
  });

  @override
  String toString() {
    return 'ShowError{errorCode: $errorCode, errorDescription: $errorDescription}';
  }
}

class DismissError {}

