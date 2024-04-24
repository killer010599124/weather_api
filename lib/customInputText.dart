import 'package:flutter/material.dart';
import 'textStyle.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController textEditingController;

  const CustomInputText({required this.textEditingController}) : super();

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      child: Container(
        height: 40,
        child: Center(
          child: TextFormField(
            controller: textEditingController,
            style: CustomTextStyle.editText,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              labelText: '',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
