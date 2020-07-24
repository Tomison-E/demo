import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return _Dashboard();
  }
  
}

class _Dashboard extends State<Dashboard> with SingleTickerProviderStateMixin{
  TabController _tc;
  @override
  void initState() {
   _tc = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,actions: <Widget>[
        SizedBox(width: 10),
        Icon(Icons.more_vert,color: Color.fromRGBO(224, 17, 95, 1.0))
      ],backgroundColor: Colors.white,elevation: 2.0),
      body: Column(
    children: [
      Card(child:TabBar(tabs: <Widget>[
        Text("DASHBOARD",style: TextStyle(color: Colors.black,fontSize: 10)),
        Text("ACTIVITY",style: TextStyle(color: Colors.black,fontSize: 10)),
      ],indicatorColor:  Color.fromRGBO(224, 17, 95, 1.0),labelColor: Colors.black,labelStyle: TextStyle(color: Colors.black,fontSize: 10),controller: _tc,labelPadding: EdgeInsets.all(20),)),
      Expanded(
        child: TabBarView(children: [
          DashboardView(),
          Container(color: Colors.grey),
        ],controller: _tc,),
      )

      ]),
      backgroundColor: Color.fromRGBO(245, 243, 248,1.0),
    );
  }
  
}


class DashboardView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _DashboardView();
  }

}

class _DashboardView extends State<DashboardView>{

  List<GridList> list;
  @override
  void initState() {
    list = [
      GridList(label: "Sales Register",image: "assets/sales.png"),
      GridList(label: "Product/Service",image: "assets/product.png"),
      GridList(label: "SMS",image: "assets/sms.png"),
      GridList(label: "Reports",image: "assets/report.png"),
      GridList(label: "Expenses",image: "assets/expenses.png"),
      GridList(label: "Sales",image: "assets/commerce-and-shopping.png"),
      GridList(label: "Customer",image: "assets/customer-behavior.png"),
      GridList(label: "Suppliers",image: "assets/inventory.png"),
      GridList(label: "staffs",image: "assets/man.png"),
      GridList(label: "Reports",image: "assets/report.png"),
      GridList(label: "Offline Sales",image: "assets/wifi.png"),
      GridList(label: "Sales Register",image: "assets/sales.png"),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children:[
       //  SizedBox(height: 20),
         SizedBox(
           height: 300,
           width: double.infinity,
           child: Card(
             color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),margin: EdgeInsets.all(15),
             child: Column(
               children: <Widget>[
                 SizedBox(height: 20),
                 Text("  Today's Transaction",style: TextStyle(color: Colors.black,fontSize: 15)),
                 Text("    15 June 2020",style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1.0),fontSize: 10)),
                 Divider(color: Color.fromRGBO(112, 112, 112, 1.0)),
                 Expanded(
                   child: Column(
                     children: <Widget>[
                       Text("₦0.00",style: TextStyle(color: Colors.black,fontSize: 40)),
                       Text("Sales",style: TextStyle(color: Colors.black,fontSize: 12)),
                       SizedBox(height: 30),
                       Row(children: <Widget>[
                         SizedBox(width: 30),
                         Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(230, 99, 149,1.0)),
                           child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(224, 17, 95, 1.0))),padding: EdgeInsets.only(right: 70),width: 250,height: 30,
                         ),SizedBox(width: 20),
                         Text("₦0.00\nProfit",style: TextStyle(color: Colors.black,fontSize: 12)),
                       ],),
                       SizedBox(height: 20),
                       Row(children: <Widget>[
                         SizedBox(width: 30),
                         Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(230, 99, 149,1.0)),
                           child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Color.fromRGBO(224, 17, 95, 1.0))),padding: EdgeInsets.only(right: 100),width: 200,height: 30,
                         ),SizedBox(width: 20),
                         Text("₦0.00\nExpenses",style: TextStyle(color: Colors.black,fontSize: 12)),
                       ],),
                     ],crossAxisAlignment: CrossAxisAlignment.center,
                   ),
                 )

               ],crossAxisAlignment: CrossAxisAlignment.start,
             ),
           ),
         ),
         SizedBox(height: 10),
         Expanded(
             child:GridView.count(
           children: list.map((item) => gridView(item.label, item.image)).toList(),
           crossAxisCount: 2,childAspectRatio: 1.2,shrinkWrap: true,
         ))
     ] ),
    );
  }

  Widget gridView(String label,String image){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Text(label,style: TextStyle(color: Colors.black,fontSize: 17)),
        ],mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

}

class GridList{
  final String label;
  final String image;

  GridList({this.label,this.image});


}