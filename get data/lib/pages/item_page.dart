
import 'package:flutter/material.dart';

class itempage extends StatelessWidget {
  itempage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs = (ModalRoute.of(context)!.settings.arguments) as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Shopping list'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
                Container(
                  width: 200, // Set the desired width for the image
                  height: 200, 
                  child: Image.network(itemArgs["ImagePath"]),
                ),
                SizedBox(
                    height: 30), // Add spacing between image and description
                Container(
                  child: Text(
                    itemArgs["name"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold // Set the font size for the description
                    ),
                  ),
                ),
            SizedBox(height: 16), // Add spacing between image and name
            Text(
              itemArgs["description"],
              style: TextStyle(
                fontSize: 15, // Set the font size to make the name bigger
              ),
            ),
          ],
        ),
      ),
    );
  }
}