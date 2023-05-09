import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/modules/loginPage/controllers/login_page_controller.dart';
import 'package:sitforsa/config/style.dart';

class InputTextFieldProfile extends StatefulWidget {
  const InputTextFieldProfile({this.input, this.controller, this.name});
  final input;
  final controller;
  final name;

  @override
  State<InputTextFieldProfile> createState() => _InputTextFieldProfileState();
}

class _InputTextFieldProfileState extends State<InputTextFieldProfile> {
  bool isShow = true;
  bool isClick = false;
  String? get _errorText {
    if (isClick) {
      final text = widget.controller.value;
      if (text == "") {
        return '${widget.input} tidak boleh kosong';
      }
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.controller.value.text);
    return TextFormField(
        cursorColor: greeny,
        controller: widget.controller.value,
        onTap: () => setState(() {
              // log(widget.controller.value);
              isClick = true;
            }),
        // initialValue: widget.controller.value.text ?? '',
        keyboardType:
            widget.input.toLowerCase() == 'nik' ? TextInputType.number : null,
        style: TextStyle(
          color: greeny,
          fontFamily: 'Product Sans',
        ),
        obscureText: widget.input.toLowerCase() == 'password' && isShow,
        decoration: InputDecoration(
            errorText: _errorText,
            suffixIcon: widget.input.toLowerCase() == 'password'
                ? IconButton(
                    onPressed: () => setState(() {
                          isShow = !isShow;
                        }),
                    icon: Icon(
                      isShow
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: greeny,
                    ))
                : null,
            alignLabelWithHint: true,
            labelStyle: TextStyle(color: greeny),
            contentPadding: EdgeInsets.all(10),
            focusColor: greeny,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greenny, width: 1),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: greeny, width: 2),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: greenny, width: 2),
                borderRadius: BorderRadius.circular(15)),
            labelText: widget.input));
  }
}
