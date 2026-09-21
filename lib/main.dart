import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TruckRouteApp()));

class TruckRouteApp extends StatefulWidget {
  @override
  State<TruckRouteApp> createState() => _TruckRouteAppState();
}

class _TruckRouteAppState extends State<TruckRouteApp> {
  String selectedInfo = "Select a route to navigate";

  Future<void> openMap(String url, String info) async {
    setState(() => selectedInfo = info);
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UAE Truck Route - Dubai'), backgroundColor: Color(0xFF0D47A1), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAN WARNING - YOUR FEATURE
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(color: Color(0xFFFFE0B2), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange)),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.red, size: 30),
                  SizedBox(width: 10),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('TRUCK BAN: E11 Sheikh Zayed 6AM-10PM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text('Use E311 / E611 - RTA Fine 1000 AED', style: TextStyle(fontSize: 12)),
                  ])),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Select Route:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            // FEATURE 1
            SizedBox(width: double.infinity, height: 55,
              child: ElevatedButton.icon(
                icon: Icon(Icons.local_shipping),
                label: Text('Dubai -> Abu Dhabi via E311', style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1565C0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () => openMap('https://www.google.com/maps/dir/Dubai/Abudhabi/', 'Route: Dubai to Abu Dhabi via E311 Emirates Road - Safe for trucks 24H'),
              ),
            ),
            SizedBox(height: 12),
            // FEATURE 2
            SizedBox(width: double.infinity, height: 55,
              child: ElevatedButton.icon(
                icon: Icon(Icons.local_shipping),
                label: Text('Jebel Ali -> Al Ain via E611', style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1565C0), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () => openMap('https://www.google.com/maps/dir/Jebel+Ali/Al+Ain/', 'Route: Jebel Ali to Al Ain via E611 - Bypass Dubai truck ban'),
              ),
            ),
            SizedBox(height: 12),
            // FEATURE 3
            SizedBox(width: double.infinity, height: 55,
              child: ElevatedButton.icon(
                icon: Icon(Icons.map),
                label: Text('Dubai Industrial City', style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                onPressed: () => openMap('https://www.google.com/maps/search/Dubai+Industrial+City/', 'Dubai Industrial City - Truck allowed zone'),
              ),
            ),

            SizedBox(height: 20),
            // FEATURE DISPLAY BOX
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blue.shade200)),
              child: Text(selectedInfo, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),

            SizedBox(height: 20),
            // RTA RULES - YOUR FEATURE
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(color: Color(0xFFECEFF1), borderRadius: BorderRadius.circular(12)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('RTA Rules:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 6),
                Text('• No trucks on E11 in Dubai: 6AM-10PM\n• Use Emirates Road E611\n• Max speed 80 km/h\n• RTA permit required inside Dubai\n• Fine 1000 AED for violation', style: TextStyle(fontSize: 13, height: 1.5)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
