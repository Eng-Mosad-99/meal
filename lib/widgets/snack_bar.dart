  import 'package:flutter/material.dart';

// ignore: unused_element
showInfoMessage(context,String message) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //علشان احذف اي snackbar قبل كده
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }