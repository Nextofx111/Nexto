import 'package:flutter/material.dart';

void main() {
  runApp(NextoApp());
}

class NextoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEXTO',
      theme: ThemeData.dark(),
      home: NextoHome(),
    );
  }
}

class NextoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('NEXTO - 100% iPhone', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.trending_up, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text('NEXTO', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Trading App', style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              onPressed: () {},
              child: Text('START TRADING', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text('100% iPhone - No Mac Needed', style: TextStyle(color: Colors.greenAccent)),
          ],
        ),
      ),
    );
  }
}
