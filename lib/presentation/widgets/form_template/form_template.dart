import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/presentation/widgets/sigin/app_attack_button.dart';
import 'package:rx_dart/presentation/widgets/text_for_field/app_attack_form_field.dart';

class AuthenticationFormTemplate extends StatelessWidget {
  final Widget? label1, label2, widget1, widget2, widget2alternative;

  final GlobalKey<FormState> _signInForm;
  final TextEditingController? _controller1, _controller2;
  final Function() onPressed;
  final TextInputType? textInputType1, textInputType2;
  final String btnText;
  final String? hintText1, hintText2;

  const AuthenticationFormTemplate({
    super.key,
    required GlobalKey<FormState> signInForm,
    TextEditingController? controller1,
    TextEditingController? controller2,
    required this.onPressed,
    required this.btnText,
    this.label1,
    this.label2,
    this.widget1,
    this.widget2,
    this.hintText1,
    this.hintText2,
    this.textInputType1,
    this.textInputType2,
    this.widget2alternative,
  })  : _signInForm = signInForm,
        _controller1 = controller1,
        _controller2 = controller2;

  @override
  Widget build(BuildContext context) {
    final _padding = MediaQuery.viewPaddingOf(context).vertical;

    print('_padding ${_padding}');
    return SizedBox(
        height: viewSize.height * 0.6 - (_padding + 30),
        child: Form(
            key: _signInForm,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex:  2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _controller1 != null
                                ? AppAttackFormField(
                                    keyboardType:
                                        textInputType1 ?? TextInputType.text,
                                    label: label1 ?? emptyWidget,
                                    controller: _controller1!,
                                    hintText: hintText1 ?? '')
                                : emptyWidget,
                            _controller2 != null
                                ? AppAttackFormField(
                                    keyboardType:
                                        textInputType2 ?? TextInputType.text,
                                    label: label2 ?? emptyWidget,
                                    controller: _controller2!,
                                    hintText: hintText2 ?? '')
                                : (widget2alternative ?? emptyWidget),
                          ])),
                  Expanded(
                      flex: 1, child: widget1 != null ? widget1! : emptyWidget),
                  Flexible(
                      flex: 1,
                      child: AppAttackButton(
                          btnText: btnText, onPressed: onPressed)),
                  Expanded(flex: 1, child: widget2 ?? emptyWidget)
                ])));
  }
}
