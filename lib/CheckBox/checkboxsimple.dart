import 'package:flutter/material.dart';

class SimpleCheckBox extends StatefulWidget {
  const SimpleCheckBox({super.key});

  @override
  State<SimpleCheckBox> createState() => _SimpleCheckBoxState();
}

class _SimpleCheckBoxState extends State<SimpleCheckBox> {
  bool chkbxState=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Check Box'),),
      body: Checkbox(value: chkbxState, onChanged: (bool? val){
        setState(() {
          chkbxState=val!;
        });

      }),
    );
  }
}