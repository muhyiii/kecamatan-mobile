import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/modules/loginPage/controllers/login_page_controller.dart';
import 'package:sitforsa/config/style.dart';

class InputTextFieldView extends StatefulWidget {
  const InputTextFieldView({super.key, this.input, this.controller});
  final input;
  final controller;

  @override
  State<InputTextFieldView> createState() => _InputTextFieldViewState();
}

class _InputTextFieldViewState extends State<InputTextFieldView> {
  bool isShow = true;
  bool isClick = false;
  String? get _errorText {
    if (isClick) {
      final text = widget.controller.value.text;
      if (text.isEmpty) {
        return '${widget.input} tidak boleh kosong';
      }
      if (widget.input.toLowerCase() == 'nik') {
        if (text.length < 16) {
          return 'Harap masukan NIK yang sesuai';
        }
      }
      if (widget.input.toLowerCase() == 'password') {
        if (text.length < 6) {
          return 'Password minimal 6 karakter';
        }
      }
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: greeny,
        controller: widget.controller,
        onTap: () => setState(() {
              isClick = true;
            }),
        keyboardType:
            widget.input.toLowerCase() == 'nik' ? TextInputType.number : null,
        style: TextStyle(
          color: greeny,
          fontFamily: 'Product Sans',
        ),
        obscureText: widget.input.toLowerCase() == 'password' && isShow,
        onChanged: (value) => setState(() {
              widget.controller.value;
            }),
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
