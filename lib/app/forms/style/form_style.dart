import 'package:flutter/material.dart';
import 'package:invoicefoxy_all/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class FormStyle extends NyFormStyle {
  /// TextField styles
  @override
  FormStyleTextField textField(BuildContext context, Field field) {
    return {
      'minimal': (NyTextField textField) => textField.copyWith(
              decorator: DecoratorTextField(
            decoration: (dynamic data, InputDecoration inputDecoration) =>
                inputDecoration.copyWith(
              filled: true,
              fillColor: Colors.grey,
              isDense: true,
              hintText: field.name,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.transparent)),
              contentPadding:
                  EdgeInsetsDirectional.symmetric(vertical: 13, horizontal: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            successDecoration:
                (dynamic data, InputDecoration inputDecoration) =>
                    inputDecoration.copyWith(
              prefixIcon: Icon(Icons.person),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.green, width: 2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
            ),
            errorDecoration: (dynamic data, InputDecoration inputDecoration) =>
                inputDecoration.copyWith(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.orange, width: 2),
                    ),
                    border: InputBorder.none),
          )),
      'default': (NyTextField textField) => textField.copyWith(
              decorator: DecoratorTextField(
            decoration: (dynamic data, InputDecoration inputDecoration) =>
                inputDecoration.copyWith(
              filled: true,
              fillColor: ThemeColor.get(context).inputBackground,
              isDense: true,
              hintText: field.name,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.black, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.transparent)),
              contentPadding:
                  EdgeInsetsDirectional.symmetric(vertical: 13, horizontal: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            successDecoration:
                (dynamic data, InputDecoration inputDecoration) =>
                    inputDecoration.copyWith(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.green, width: 2)),
            ),
            errorDecoration: (dynamic data, InputDecoration inputDecoration) =>
                inputDecoration.copyWith(
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              errorStyle: TextStyle(color: Colors.redAccent[400]),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.redAccent, width: 1),
              ),
            ),
          )),
    };
  }

  /// Checkbox styles
  // @override
  // FormStyleCheckbox checkbox(BuildContext context, Field field) {
  //   return {
  //     'default': () => FormCast.checkbox(
  //
  //     ),
  //   };
  // }
}
