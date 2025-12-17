import 'package:flutter/material.dart';

class Details extends StatefulWidget {

final data;
const Details({super.key, this.data});

@override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: AppBar(
      backgroundColor: Colors.grey[200],
      title: const Row(
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.shop_2_outlined),
        Text(" Ecomerce "),
        Text("Omar", style: TextStyle(color: Colors.orange),),
      ],) ,
      ),

      body: ListView(
        children: [
          Icon(widget.data["iconName"], size: 300),
          Text(widget.data["title"], textAlign: .center,style: TextStyle(fontWeight: .bold, fontSize: 20),),
          Container(height: 8,),
          Text(widget.data["description"], textAlign: .center, style: TextStyle(color: Colors.grey[700]),),
          Container(height: 12,),
          Text(widget.data["price"], textAlign: .center, style: TextStyle(color: Colors.orange, fontWeight: .bold, ),),
          Container(height: 30,),

          Row(
            mainAxisAlignment: .center,
            children: [
            Text("Color: ", style: TextStyle(color: Colors.grey[750]),),
            Container(margin: .symmetric(horizontal: 4), width: 24, height: 24, decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(30))),
            Text("Grey"),
            SizedBox(width: 20,), 
            Container(margin: .only(right: 2), width: 24, height: 24, decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30))), 
            Text("Black"),
            ],),

            Container(height: 12,),
            Text("Size:  34 35  40 41  ", style: TextStyle(color: Colors.grey),textAlign: .center,),


            Container(
              height: 44,
              margin: .symmetric(vertical: 24, horizontal: 60),
              child: MaterialButton(
          
                onPressed: (){}, 
                child: Text("Add to cart", style: TextStyle(color: Colors.white),),
                 color: Colors.black,)),
        ],
      ),
    );
  }

}