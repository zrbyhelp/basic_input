import 'package:flutter/material.dart';

import '../z_input_config.dart';

InputDecoration zInputDecorationNone({String? hintText,EdgeInsets? padding}) =>  InputDecoration(
  hintText: hintText,
  border: InputBorder.none,
  isDense:true,

  contentPadding: ZInputConfig.defPadding ?? padding
);