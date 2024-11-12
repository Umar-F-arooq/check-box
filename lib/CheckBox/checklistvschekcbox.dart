import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckListAndCheckBox extends StatefulWidget {
  const CheckListAndCheckBox({super.key});

  @override
  State<CheckListAndCheckBox> createState() => _CheckListAndCheckBoxState();
}

class _CheckListAndCheckBoxState extends State<CheckListAndCheckBox> {
  bool chkbx1State=false;
  bool chkbx2State=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check list and check box'),),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(value: chkbx1State, onChanged: (bool? val){
                setState(() {
                  chkbx1State=val!;
                });
              }),
              GestureDetector(
                onTap: (){
                  setState(() {
                    chkbx1State=!chkbx1State;
                  });
                },
                child: Text('Checkbox 1'))
            ],
          ),
          SizedBox(height: 10,),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Check Box 2'),
            value: chkbx2State, onChanged: (bool? val){
              setState(() {
                chkbx2State=val!;
              });
            })

        ],
      ),
    );
  }
}