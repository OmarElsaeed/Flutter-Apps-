import 'package:flutter/material.dart';
import 'package:ecommerce_app/details.dart';

class Home extends StatefulWidget {
    
    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List categories = [
     { "title": "Laptop", "iconName": Icons.laptop },
     { "title": "Mobile", "iconName": Icons.phone_android },
     { "title": "Bike", "iconName": Icons.bike_scooter},
     { "title": "Gifts", "iconName": Icons.card_giftcard },
     { "title": "Car","iconName": Icons.car_repair }
  ];

 List items = [
     { "title": "Wireless Headphone", "iconName": Icons.headphones, "description": "Headphone Fine Good", "price": "\$350"},
     { "title": "Watch", "iconName": Icons.watch, "description": "Watch Fine Good", "price": "\$200"},
     { "title": "Car", "iconName": Icons.car_rental_sharp, "description": "Car Fine Good", "price": "\$1000"},
     { "title": "Car", "iconName": Icons.car_rental_sharp, "description": "Car Fine Good", "price": "\$200"},
  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      iconSize: 32,
      selectedItemColor: Colors.orange,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "*"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "*"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "*"),
    ]
    ),
  body: Container(
    padding: .all(20),
    child: ListView(
      children: [
        // Search 
        Row(
          children: [
            Expanded(
              child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hint: Text("search"),
                border: .none,
                fillColor: Colors.grey[200],
                filled: true,
                ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(Icons.menu),
            )
          ],
        ),

      Container(height: 30),
      Text("Categories", style: TextStyle(fontSize: 20, fontWeight: .bold),),
      Container(height: 16),

      Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: .horizontal,
          itemCount: categories.length,
          itemBuilder: (context,i) {
            return Container(
              margin: .only(right: 16),
              child: Column(
                children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  padding: .all(16),
                  margin: .only(bottom: 4),
                  child: Icon(categories.elementAt(i)["iconName"], size: 40),
                ),
                Text(categories.elementAt(i)["title"], style: TextStyle(fontWeight: .bold, color: Colors.grey[800]),),
              ],),
            );
          }
        ),
      ),
// ============================
      Container(height: 30),
      Text("Best Selling", style: TextStyle(fontSize: 20, fontWeight: .bold),),
      Container(height: 16),
// ===============================
      Container(
        child: GridView.builder(
          itemCount: items.length,
          physics:NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220
            ),
         itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: 
              (context) => Details(data: items[i])));
            },
            child: Card(
              child: Column(
                 spacing: 2,
                crossAxisAlignment: .start,
                children: [
                Container(
                  width: 300,
                  padding: .all(20),
                  color: Colors.grey[200],
                  child: Icon(items[i]["iconName"],size: 100,),
                  ), 
                  Text(items[i]["title"], style: TextStyle(color: Colors.grey[800], fontWeight: .bold, fontSize: 16),),
                  Text(items[i]["description"], style: TextStyle(color: Colors.grey)),
                  Text(items[i]["price"], style: TextStyle(color: Colors.orangeAccent, fontWeight: .bold,fontSize: 16)),
              ],),
            ),
          );
         }
        ,),
      )

      ],
      
    ),
  ),
  );
}
}