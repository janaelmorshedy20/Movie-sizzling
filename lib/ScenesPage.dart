import 'package:flutter/material.dart';

class ScenesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detected Scenes'),
        backgroundColor: const Color.fromARGB(255, 169, 148, 140),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scenes Found: a man eats an apple',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSceneCard(),
                  _buildSceneCard(),
                  _buildSceneCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSceneCard() {
    return Card(
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.movie, color: Colors.black),
          ),
          SizedBox(height: 10),
          Icon(Icons.image, size: 100, color: Colors.black), // Only the image icon
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
