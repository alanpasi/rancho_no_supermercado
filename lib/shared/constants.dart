import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Digite o seu email',
//  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0)),
  labelText: 'Email',
  labelStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
);
