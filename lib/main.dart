import 'package:flutter/material.dart';

void main() => runApp(NextoApp());

class NextoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: KeyScreen());
  }
}

class KeyScreen extends StatefulWidget {
  @override
  _KeyScreenState createState() => _KeyScreenState();
}

class _KeyScreenState extends State<KeyScreen> {
  TextEditingController c = TextEditingController();
  String err = "";
  final keys = ["NEXTO-IPHONE-KEY", "NEXT0-DE-NEXTO", "IPHONE-VIP-2024", "NEXTO-15PRO-MAX"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.phone_iphone, size: 80, color: Color(0xFF00FF88)),
            Text("NEXTO iPhone", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
            Text("iPhone Only Access", style: TextStyle(color: Color(0xFF00FF88))),
            SizedBox(height: 40),
            TextField(controller: c, style: TextStyle(color: Colors.white), decoration: InputDecoration(hintText: "Enter iPhone Key", filled: true, fillColor: Color(0xFF1A1A1A), prefixIcon: Icon(Icons.vpn_key, color: Color(0xFF00FF88)), border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Color(0xFF00FF88), width: 2)))),
            SizedBox(height: 10),
            if (err.isNotEmpty) Text(err, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () { if (keys.contains(c.text.trim())) { Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => IPhoneOnlyApp())); } else { setState(() => err = "❌ Key غالط"); } }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF00FF88), padding: EdgeInsets.symmetric(vertical: 18), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), child: Text("UNLOCK iPhone SETTINGS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)))),
            SizedBox(height: 15),
            Text("Demo: NEXTO-IPHONE-KEY", style: TextStyle(color: Colors.grey, fontSize: 12))
          ]),
        ),
      ),
    );
  }
}

class IPhoneOnlyApp extends StatefulWidget {
  @override
  _IPhoneOnlyAppState createState() => _IPhoneOnlyAppState();
}

class _IPhoneOnlyAppState extends State<IPhoneOnlyApp> {
  String sel = "iPhone 15 Pro Max";
  final iphones = {
    "iPhone 11": {"General": 90, "Red Dot": 85, "2x": 80, "4x": 75, "AWM": 50, "DPI": 450},
    "iPhone 12": {"General": 92, "Red Dot": 86, "2x": 82, "4x": 76, "DPI": 460},
    "iPhone 13": {"General": 94, "Red Dot": 88, "2x": 84, "4x": 78, "DPI": 470},
    "iPhone 14 Pro Max": {"General": 96, "Red Dot": 90, "2x": 86, "4x": 80, "DPI": 485},
    "iPhone 15 Pro Max": {"General": 100, "Red Dot": 92, "2x": 88, "4x": 82, "DPI": 500},
    "iPhone 16 Pro Max": {"General": 100, "Red Dot": 95, "2x": 90, "4x": 85, "DPI": 520},
    "iPhone de Nexto": {"General": 98, "Red Dot": 91, "2x": 87, "4x": 81, "DPI": 490},
  };

  @override
  Widget build(BuildContext context) {
    var s = iphones[sel]!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text("NEXTO iPhone VIP ✅", style: TextStyle(color: Color(0xFF00FF88), fontWeight: FontWeight.bold)), actions: [IconButton(icon: Icon(Icons.logout), onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => KeyScreen())))]),
      body: Column(children: [
        Container(margin: EdgeInsets.all(16), padding: EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFF00FF88))), child: DropdownButton<String>(value: sel, isExpanded: true, dropdownColor: Color(0xFF1A1A1A), underline: SizedBox(), icon: Icon(Icons.phone_iphone, color: Color(0xFF00FF88)), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), onChanged: (v) => setState(() => sel = v!), items: iphones.keys.map((k) => DropdownMenuItem(value: k, child: Text(k))).toList())),
        Expanded(child: ListView(padding: EdgeInsets.all(12), children: s.entries.map((e) => Card(color: Color(0xFF1A1A1A), child: ListTile(title: Text(e.key, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), trailing: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5), decoration: BoxDecoration(color: Color(0xFF00FF88), borderRadius: BorderRadius.circular(15)), child: Text("${e.value}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))), subtitle: Slider(value: e.value.toDouble(), min: 0, max: e.key == "DPI" ? 600 : 100, activeColor: Color(0xFF00FF88), onChanged: (v) {})))).toList()))
      ]),
    );
  }
}
