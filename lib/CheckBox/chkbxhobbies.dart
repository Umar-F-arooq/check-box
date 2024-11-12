import 'package:flutter/material.dart';

class ChkbxHobbies extends StatefulWidget {
  const ChkbxHobbies({super.key});

  @override
  State<ChkbxHobbies> createState() => _ChkbxHobbiesState();
}

class _ChkbxHobbiesState extends State<ChkbxHobbies> {
  bool chkbxCric=false;
  bool chkbxHock=false;
  bool chkbxFoot=false;
  String ? message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:message==null? chekcBoxView():Text(message!,style: TextStyle(fontSize: 20),)
    );
  }

  Padding chekcBoxView() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Select your fav sport..'),
          SizedBox(height: 10,),
          Row(
            children: [
              Checkbox(value: chkbxCric, onChanged: (val){
                setState(() {
                  chkbxCric=val!;
                });

              }),
              Text('Cricket')
            ],
          ),
           SizedBox(height: 10,),
          Row(
            children: [
              Checkbox(value: chkbxHock, onChanged: (val){
                setState(() {
                  chkbxHock=val!;
                });

              }),
              Text('Hockey')
            ],
          )
          ,
           SizedBox(height: 10,),
          Row(
            children: [
              Checkbox(value: chkbxFoot, onChanged: (val){
                setState(() {
                  chkbxFoot=val!;
                });

              }),
              Text('Football')
            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            if(!chkbxCric && !chkbxHock && !chkbxFoot)
            {
              message="No sports selected ";

            }
            else
            {
              if(chkbxCric)
              {
                message="Cricket";
              }
              if(chkbxFoot)
              {
                if(message==null)
                message="Football";
                else
                message=message!+"\nFootball";
              }
              if(chkbxHock)
              {
                if(message==null)
                message="Hockey";
                else
                message=message!+"\nHockey";

              }
            }
            setState(() {
              
            });

          }, child: Text('Submit'))
          
          


        ],
      ),
    
    );
  }
}