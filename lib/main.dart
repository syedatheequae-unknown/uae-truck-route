import 'package:flutter/material.dart';

void main() => runApp(const TruckApp());

class TruckApp extends StatelessWidget {
  const TruckApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UAE Truck Route',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UAE Truck Route - Dubai'), backgroundColor: Colors.blue[800], foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(color: Colors.orange[100], child: ListTile(leading: const Icon(Icons.warning, color: Colors.red), title: const Text('Truck Ban: E11 Sheikh Zayed 6AM-10PM'), subtitle: const Text('Use E311 / E611'))),
          const SizedBox(height:10),
          const Text('Select Route:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height:10),
          ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.local_shipping), label: const Text('Dubai -> Abu Dhabi (E311)'), style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50))),
          const SizedBox(height:10),
          ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.local_shipping), label: const Text('Jebel Ali -> Al Ain (E611)'), style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50))),
          const SizedBox(height:10),
          ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.map), label: const Text('Dubai Industrial City Route'), style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.green)),
          const SizedBox(height:20),
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('RTA Rules:', style: TextStyle(fontWeight: FontWeight.bold)), Text('• No trucks on E11 in Dubai 6AM-10PM\n• Use Emirates Road E611 for transit\n• Max speed 80 km/h\n• Check RTA permit before entering Dubai')]))
        ],
      ),
    );
  }
}
