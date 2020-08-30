import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class MessageState{
  final bool isShowing;
  final int messageCode;
  final String messageDescription;

  MessageState({
    this.isShowing,
    this.messageCode,
    this.messageDescription
  });


  MessageState copyWith({
    bool isShowing,
    int messageCode,
    String messageDescription
  }){
    return new MessageState(
        isShowing: isShowing,
        messageCode: messageCode,
        messageDescription: messageDescription
    );
  }

  factory MessageState.initial(){
    return new MessageState(
      isShowing: false,
      messageCode: 0,
      messageDescription: ""
    );
  }
}
