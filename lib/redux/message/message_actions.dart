// Packages
import 'package:flutter/foundation.dart';

class ShowMessage {
  final int messageCode;
  final String messageDescription;

  ShowMessage({
    @required this.messageCode,
    @required this.messageDescription,
  });

  @override
  String toString() {
    return 'ShowMessage{messageCode: $messageCode, messageDescription: $messageDescription}';
  }
}

class DismissMessage {}

