import 'package:flutter/material.dart';
import 'package:tech_blog/config/theme/app_colors.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainerWidget({
    super.key,
    this.controller,
    this.fieldKey,
    this.hintText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
  });

  @override
  _FormContainerWidgetState createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: textTheme.displaySmall!.copyWith(
          color: AppColors.textTitle,
        ),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: textTheme.displaySmall!.copyWith(
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
