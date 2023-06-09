import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DialogWidget {
  BuildContext context;
  ProgressDialog? pd;
  DialogWidget({required this.context}) {
    pd = ProgressDialog(context: context);
  }

  void showProgress() {
    pd!.show(
        msg: "Waiting please",
        msgColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        progressBgColor: Colors.purple,
        progressValueColor: Colors.pinkAccent,
        barrierColor: Colors.white.withOpacity(0.2));
  }

  void closeProgress() {
    pd!.close();
  }

  Future<void> showSuccesDialog(String title, String desc) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> showErrorDialog(String title, String desc) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
