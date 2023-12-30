import 'package:flutter/material.dart';

String? validateInput(String? value, TextInputType keyboardType) {
  // Perform validation based on keyboard type
  if (value != null) {
    return switch (keyboardType) {
      TextInputType.text =>
        value.length <= 2 ? 'Please enter at least 3 characters' : null,
      TextInputType.number => value.isEmpty
          ? 'Please enter a number'
          : double.tryParse(value) == null
              ? 'Please enter a valid number'
              : null,
      TextInputType.emailAddress =>
        !value.contains('@') ? 'Please enter a valid email address' : null,
      TextInputType.none => null,
      TextInputType.datetime => null,
      TextInputType.phone => null,
      TextInputType.multiline => null,
      TextInputType.url => null,
      TextInputType.numberWithOptions => null,
      TextInputType.visiblePassword => null,
      TextInputType.name => null,
      TextInputType.streetAddress => null,
      TextInputType.number => null,
      TextInputType() => null,
    };
  }
 else {
    return null;
  }
}
