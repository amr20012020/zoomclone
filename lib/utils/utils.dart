import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBr(BuildContext context, String text)
{
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(text)),
  );

}