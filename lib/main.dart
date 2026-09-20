import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main(){runApp(const MyApp());}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'UAE Truck Route',
      home: const TruckRouteScreen(),
    );
  }
}

class TruckRouteScreen extends StatefulWidget{
  const TruckRouteScreen({super.key});
  @override State<TruckRouteScreen> createState()=>_TruckRouteScreenState();
}

class _TruckRouteScreenState extends State<TruckRouteScreen>{
  GoogleMapController? mapController;
  final fromCtrl=TextEditingController(text:'Jebel Ali, Dubai');
  final toCtrl=TextEditingController(text:'Al Quoz, Dubai');
  final heightCtrl=TextEditingController(text:'4.5');
  final weightCtrl=TextEditingController(text:'15');
  bool avoidBridge=true;
  bool rta=true;
  String info='Ready - Click Calculate';

  static const CameraPosition dubai=CameraPosition(target:LatLng(25.2048,55.2708),zoom:11);

  void calc(){
    double h=double.tryParse(heightCtrl.text)??4.5;
    double w=double.tryParse(weightCtrl.text)??15;
    String warn='';
    if(h>5.0) warn+='⚠️ Height >5m: Avoid Maktoum & Floating Bridge\n';
    if(w>10) warn+='⚠️ Weight >10T: RTA Permit needed SZR\n';
    if(avoidBridge) warn+='✅ Avoiding Low Bridges (<4.5m)\n';
    if(rta) warn+='✅ RTA Truck Route (No SZR 7:30-9:30, 5-8 PM)\n';
    setState((){
      info='FROM: ${fromCtrl.text}\nTO: ${toCtrl.text}\nTruck: ${h}m / ${w}T\n\n$warn\n📍 28 KM | ⏱️ 45 mins\n🛣️ E311 > E66 > Al Khail Rd';
    });
  }

  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('UAE TRUCK ROUTE - RTA',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),backgroundColor:Color(0xFF0D5C33)),
      body: Column(children:[
        Expanded(flex:2,child: GoogleMap(initialCameraPosition:dubai,onMapCreated:(c)=>mapController=c,myLocationEnabled:true)),
        Expanded(flex:3,child: SingleChildScrollView(padding:EdgeInsets.all(12),child: Column(children:[
          Row(children:[Expanded(child: TextField(controller:fromCtrl,decoration:InputDecoration(labelText:'FROM',border:OutlineInputBorder()))),SizedBox(width:8),Expanded(child: TextField(controller:toCtrl,decoration:InputDecoration(labelText:'TO',border:OutlineInputBorder())))]),
          SizedBox(height:8),
          Row(children:[Expanded(child: TextField(controller:heightCtrl,decoration:InputDecoration(labelText:'Height m',border:OutlineInputBorder()))),SizedBox(width:8),Expanded(child: TextField(controller:weightCtrl,decoration:InputDecoration(labelText:'Weight T',border:OutlineInputBorder())))]),
          Row(children:[Checkbox(value:avoidBridge,onChanged:(v)=>setState(()=>avoidBridge=v!)),Text('Avoid Bridges'),Checkbox(value:rta,onChanged:(v)=>setState(()=>rta=v!)),Text('RTA')]),
          SizedBox(width:double.infinity,child: ElevatedButton(onPressed:calc,style:ElevatedButton.styleFrom(backgroundColor:Color(0xFF0D5C33)),child: Text('CALCULATE TRUCK ROUTE',style:TextStyle(color:Colors.white)))),
          SizedBox(height:10),
          Container(width:double.infinity,padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Colors.green.shade50,border:Border.all(color:Colors.green)),child: Text(info)),
        ]))),
      ]),
    );
  }
}
