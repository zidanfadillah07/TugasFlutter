import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _result = "";

  void _calculateBMI() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;
    double bmi = weight / (height * height);

    String result;
    if (bmi < 18.5) {
      result = "Kurus";
    } else if (bmi < 25) {
      result = "Normal";
    } else {
      result = "Obesitas";
    }

    setState(() { 
      _result = "Anda termasuk kategori: $result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator IMT'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18),
          child: TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Masukkan tinggi badan Anda dalam cm: ",                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15)),),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Masukkan berat badan Anda dalam kg: ",                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15)),),
            ),
          ),
          Container(child: Spacer()),
          Text(_result,style: TextStyle(fontSize: 18)),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(  // Ganti FlatButton dengan TextButton 
                child: Text("Hitung"),
                onPressed: _calculateBMI,
              ),
            ),
          ),
        ],
      ),
    );
  }
}