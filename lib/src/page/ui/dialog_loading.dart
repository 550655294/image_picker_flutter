import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog._();

  static showLoadingDialog(BuildContext context,{bool useRootNavigator = true}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
