import 'package:basic_input/z_input_config.dart';
import 'package:flutter/material.dart';
export 'package:basic_input/input_decoration/input_decoration_none.dart';
///ZInput基本输入框
///[zInputType] 输入框类型
///[validation] 附加输入验证验,验证优先级高于默认zInputType内默认验证
///[inputDecoration] 输入框修饰
///[textInputAction] 键盘弹出确认按钮样式
///[focusNode] 焦点
///[onFieldSubmitted] 点击键盘确认按钮
///[onSaved] 表单保存事件处理
///[initialValue] 初始化文本
///[enabled] 是否有效
///[controller] 控制器
///[cursorColor] 光标颜色
///[style] 基本样式
class ZInput extends StatelessWidget{
  final ZInputType zInputType;
  final String? Function(String value)? validation;
  final InputDecoration? inputDecoration;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
  final bool enabled;
  final TextEditingController? controller;
  final Color? cursorColor;
  final TextStyle? style;
  final GlobalKey<FormFieldState>? fieldKey;
  const ZInput({
    super.key,
    this.zInputType=ZInputType.none,
    this.validation,
    this.inputDecoration,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.onSaved,
    this.initialValue,
    this.enabled = true,
    this.controller,
    this.cursorColor,
    this.style,
    this.fieldKey
  });
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormFieldState> formFieldKey = fieldKey??GlobalKey();
    return TextFormField(
      key: formFieldKey,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted:(value){
        var type = formFieldKey.currentState?.validate();
        if(type??true){
          onFieldSubmitted?.call(value);
        }
      } ,
      obscureText: zInputType.obscure(),
      onSaved: onSaved,
      validator: (value) {
        return validation?.call(value??"")??zInputType.validator(value??"");
      },
      cursorColor: cursorColor??ZInputConfig.cursorColor,
      initialValue: initialValue,
      enabled: enabled,
      keyboardType:zInputType.getType(),
      controller: controller,
      style: style??ZInputConfig.style,
      decoration:  inputDecoration
    );
  }
}