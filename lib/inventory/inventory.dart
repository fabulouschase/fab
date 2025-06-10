import 'package:flutter/material.dart';

import '../home/MyHomePage.dart';

class Inventorypage extends StatefulWidget {
  const Inventorypage({super.key});

  @override
  State<Inventorypage> createState() => _InventorypageState();
}

class _InventorypageState extends State<Inventorypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "car",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: const Text("Home"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Inventorypage()),
              );
            },
            child: const Text("Inventory"),
          ),
          TextButton(onPressed: () {}, child: const Text("Contact")),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                _buildCarCard(
                  "2020 BMW M4",
                  "Sports",
                  "\$65,000",
                  "https://i.ibb.co/TMkrLN09/360526306-11452734.png",
                ),
                _buildCarCard(
                  "2021 BMW X5",
                  "SUV",
                  "\$55,000",
                  "https://i.ibb.co/TMkrLN09/360526306-11452734.png",
                ),
                _buildCarCard(
                  "2022 BMW i4",
                  "Electric",
                  "\$60,000",
                  "https://i.ibb.co/TMkrLN09/360526306-11452734.png",
                ),
                _buildCarCard(
                  "2018 BMW 7 Series",
                  "Sedan",
                  "\$45,000",
                  "https://i.ibb.co/mF19cFPp/ildar-garifullin-u-X4-Bjke-x-UE-unsplash-removebg-preview.png",
                ),
                _buildCarCard(
                  "2018 BMW 7 Series",
                  "Sedan",
                  "\$45,000",
                  "https://i.ibb.co/9996RWJZ/hyundai-motor-group-V1-DFo8-C4-JPA-unsplash-removebg-preview.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCarCard(String title, String type, String price, String imageUrl) {
  return Card(
    color: Colors.white,
    child: SizedBox(
      width: 120,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 80,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(type),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
