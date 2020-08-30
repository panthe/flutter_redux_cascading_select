// Packages
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class ErrorState{
  final bool isShowing;
  final int errorCode;
  final String errorDescription;

  ErrorState({
    this.isShowing,
    this.errorCode,
    this.errorDescription
  });


  ErrorState copyWith({
    bool isShowing,
    int errorCode,
    String errorDescription
  }){
    return new ErrorState(
        isShowing: isShowing,
        errorCode: errorCode,
        errorDescription: errorDescription
    );
  }

  factory ErrorState.initial(){
    return new ErrorState(
      isShowing: false,
      errorCode: 0,
      errorDescription: ""
    );
  }
}
