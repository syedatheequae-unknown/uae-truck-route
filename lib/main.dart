import 'package:flutter/material.dart';

void main() => runApp(const TruckApp());

class TruckApp extends StatelessWidget {
  const TruckApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UAE Truck Route',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UAE Truck Route - Dubai'),
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.orange[100],
            child: const ListTile(
              leading: Icon(Icons.warning_amber_rounded, color: Colors.red, size: 32),
              title: Text('TRUCK BAN: E11 Sheikh Zayed 6AM-10PM', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Use E311 / E611 - RTA Fine 1000 AED'),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Select Route:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.local_shipping),
            label: const Text('Dubai -> Abu Dhabi via E311'),
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 55), backgroundColor: Colors.blue[700], foregroundColor: Colors.white),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.local_shipping),
            label: const Text('Jebel Ali -> Al Ain via E611'),
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 55), backgroundColor: Colors.blue[700], foregroundColor: Colors.white),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.map),
            label: const Text('Dubai Industrial City'),
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 55), backgroundColor: Colors.green[700], foregroundColor: Colors.white),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blue[200]!)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('RTA Rules:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Text('• No trucks on E11 in Dubai: 6AM-10PM\n• Use Emirates Road E611\n• Max speed 80 km/h\n• RTA permit required inside Dubai'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
