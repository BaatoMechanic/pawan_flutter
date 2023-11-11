// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_baato/src/features/validators/validation.dart';
import 'package:mechanic_baato/src/utils/managers/color_manager.dart';
import 'package:mechanic_baato/src/utils/managers/values_manager.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.title,
    this.labelText,
    this.hintText,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);
  final String title;
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: AppHeight.h4,
          ),
          Platform.isIOS
              ? CupertinoTextField(
                  controller: widget.controller,
                  obscureText: _obscurePassword,
                  placeholder: widget.labelText,

                  focusNode: widget.focusNode,
                  textInputAction: widget.nextFocusNode == null
                      ? TextInputAction.done
                      : TextInputAction.next,
                  keyboardType: TextInputType.text,
                  suffix: CupertinoButton(
                    child: Icon(_obscurePassword
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),

                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                      left: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                    ),
                  ),
                  onEditingComplete: () {
                    if (widget.nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(widget.nextFocusNode);
                    }
                    // else
                    // _userProvider.loginScreenSaveForm(
                    //     context, _form, mounted);
                  },
                  // onChanged: (value) {
                  //   if (isPassword) {
                  //     setState(() {
                  //       _userProvider.loginScreenUserpassword = value;
                  //     });
                  //   } else {
                  //     setState(() {
                  //       _userProvider.loginScreenUsernameOrEmail = value;
                  //     });
                  //   }
                  // },
                )
              : TextFormField(
                  controller: widget.controller,
                  obscureText: _obscurePassword,
                  focusNode: widget.focusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => AppValidator.validatePassword(value),
                  textInputAction: widget.nextFocusNode == null
                      ? TextInputAction.done
                      : TextInputAction.next,
                  keyboardType: TextInputType.text,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration().copyWith(
                    labelText: widget.labelText,
                    hintText: widget.hintText,
                    suffix: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          !_obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        }),
                  ),

                  onFieldSubmitted: (_) {
                    if (widget.nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(widget.nextFocusNode);
                    }
                    // else {
                    //   _userProvider.loginScreenSaveForm(
                    //       context, _form, mounted);
                    // }
                  },
                  // onSaved: (value) {
                  //   if (isPassword) {
                  //     _userProvider.loginScreenUserpassword = value;
                  //   } else {
                  //     _userProvider.loginScreenUsernameOrEmail = value;
                  //   }
                  // },
                ),
        ],
      ),
    );
  }
}
