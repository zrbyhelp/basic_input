import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///输入框类型
enum ZInputType{
  email, //邮箱类型
  emailCode, //邮箱验证码
  smsCode, //短信验证码
  password, //密码
  name, //姓名
  number, //数值
  none; //不限制
  //是否模糊显示
  bool obscure(){
    bool bl = false;
    switch(this){
      case ZInputType.password:
        bl = true;
        break;
      default:
        bl = false;
    }
    return bl;
  }
  //键盘类型
  TextInputType getType(){
    switch(this){
      case ZInputType.password:
        return TextInputType.text;
      case ZInputType.name:
        return TextInputType.text;
      case ZInputType.none:
        return TextInputType.text;
      case ZInputType.emailCode:
        return TextInputType.number;
      case ZInputType.email:
        return TextInputType.emailAddress;
      case ZInputType.smsCode:
        return TextInputType.text;
      case ZInputType.number:
        return TextInputType.number;
    }
  }

  ///基本判断
  String? validator(String value){
    switch(this){
      case ZInputType.password:
        RegExp reg =  RegExp(r'^[\dA-Za-z\x21-\x7e]{6,20}$');
        if (!reg.hasMatch(value)) {
          return ZInputConfig.passwordErrorText;
        }
        break;
      case ZInputType.email:
        RegExp reg =  RegExp(r'^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+');
        if (!reg.hasMatch(value)) {
          return ZInputConfig.emailErrorText;
        }
        break;
      case ZInputType.name:
        RegExp reg =  RegExp(r'^.{1,20}$');
        if (!reg.hasMatch(value.trim())) {
          return ZInputConfig.nameErrorText;
        }
        break;
      case ZInputType.none:
        break;
      case ZInputType.emailCode:
        if(value.length!=ZInputConfig.emailCodeLength){
          return ZInputConfig.emailCodeErrorText;
        }
        break;
      case ZInputType.smsCode:
        if(value.length!=ZInputConfig.smsCodeLength){
          return ZInputConfig.smsCodeErrorText;
        }
        break;
      case ZInputType.number:
        if(double.tryParse(value) == null){
          return ZInputConfig.numberErrorText;
        }
        break;
    }
    return null;
  }
}
class ZInputConfig {
  static register({
    required int emailCodeLength,
    required int smsCodeLength,
    required Color cursorColor,
    required TextStyle style,
    required String passwordErrorText,
    required String emailErrorText,
    required String nameErrorText ,
    required String emailCodeErrorText,
    required String smsCodeErrorText,
    required String numberErrorText,
    required EdgeInsets defPadding,
  }){
    ZInputConfig.emailCodeLength = emailCodeLength;
    ZInputConfig.smsCodeLength = smsCodeLength;
    ZInputConfig.cursorColor = cursorColor;
    ZInputConfig.style = style;
    ZInputConfig.passwordErrorText = passwordErrorText;
    ZInputConfig.emailErrorText = emailErrorText;
    ZInputConfig.nameErrorText = nameErrorText;
    ZInputConfig.emailCodeErrorText = emailCodeErrorText;
    ZInputConfig.smsCodeErrorText = smsCodeErrorText;
    ZInputConfig.numberErrorText = numberErrorText;
    ZInputConfig.defPadding = defPadding;
  }
  static int  emailCodeLength = 6;
  static int  smsCodeLength = 4;
  static Color?  cursorColor;
  static TextStyle? style ;
  static EdgeInsets? defPadding;
  static String passwordErrorText = "Invalid password";
  static String emailErrorText = "Invalid email";
  static String nameErrorText = "Invalid name";
  static String emailCodeErrorText = "Invalid code";
  static String smsCodeErrorText = "Invalid code";
  static String numberErrorText = "Invalid number";
}