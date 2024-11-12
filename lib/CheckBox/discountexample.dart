import 'dart:isolate';

import 'package:flutter/material.dart';

class DiscountExample extends StatefulWidget {
  const DiscountExample({super.key});

  @override
  State<DiscountExample> createState() => _DiscountExampleState();
}

class _DiscountExampleState extends State<DiscountExample> {
  TextEditingController quantitycontroller=TextEditingController();
  TextEditingController pricecontroller=TextEditingController();
  TextEditingController discountController=TextEditingController();
  bool allowDiscount=false;
  bool isMember=false;
  String ?reciept;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bill Calcuation'),),
      body: Column(
        children: [
          TextFormField(
            controller: quantitycontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Quantity',
              labelText: 'Qunatity'
            ),
          ),
          SizedBox(height: 10,),
        TextFormField(
            controller: pricecontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Price',
              labelText: 'Price'
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Checkbox(value: allowDiscount, 
              onChanged: (val){
                setState(() {
                  allowDiscount=val!;
                  discountController.text="0";
                });

              }),
              Text('Discount'),
              SizedBox(width: 10,),
              Container(width: 100,
              height: 60,
              child: TextFormField(
                readOnly: !allowDiscount,
            controller: discountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Discount',
              labelText: 'Discount'
            ),
          ),
              )
               

            ],
          ),
          SizedBox(height: 10,),
          Row(children: [
            Checkbox(value: isMember, onChanged: (val){
              setState(() {
                isMember=val!;
              });
            }),
            Text('Is Member')
          ],)
          ,
          ElevatedButton(onPressed: (){
          int qty=int.parse(quantitycontroller.text);
          int price=int.parse(pricecontroller.text);
          int discount=0;
          int bill=qty*price;
          double memberShipDiscount=0;
          if(allowDiscount){
            discount=int.parse(discountController.text);

          }
          if(isMember)
          {
            // 5% of bill is discounted to members
            memberShipDiscount=bill*5/100;
          }
          double payable=bill-(discount+memberShipDiscount);
          reciept='Amount\t{$bill}\nDiscount\t${discount}\nMembership\t${memberShipDiscount}\nPaybale\t${payable}';
          setState(() {
            
          });
            

          }, child:Text('Calculate')),
          reciept==null?Text(''):Text(reciept!)

        ],
      ),
    );
  }
}