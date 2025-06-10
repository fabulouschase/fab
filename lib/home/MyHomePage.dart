import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fab/inventory/inventory.dart';
import 'package:visibility_detector/visibility_detector.dart'
    show VisibilityDetector;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  // Define the GlobalKey for VisibilityDetector
  final GlobalKey _textKey = GlobalKey();
  // AnimationController to manage animation lifecycle
  AnimationController? _animationController;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "FIND YOUR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const Text(
                    "NEXT CAR",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Explore our wide range\nof quality vehicles. We\noffer a variety of makes\nand models to suit your\nneeds.",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 90),
                      SizedBox(
                        height: 400,
                        width: 620,
                        child: Image.network(
                          // Replace with a valid BMW image URL
                          "https://i.ibb.co/TMkrLN09/360526306-11452734.png",
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        "Explore our wide range\nof quality vehicles. We\noffer a variety of makes\nand models to suit your\nneeds.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6, width: double.infinity),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: "All makes",
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "All",
                                child: Text("All makes"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: "All models",
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "All",
                                child: Text("All models"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: "Price range",
                              border: OutlineInputBorder(),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "All",
                                child: Text("Price range"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                          ),
                          child: const Text("Search"),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Featured Listings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  // Use Wrap for responsive car cards
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
                      _carbuild(
                        "2018 BMW 7 Series",
                        "Sedan",
                        "\$45,000",
                        "https://i.ibb.co/mF19cFPp/ildar-garifullin-u-X4-Bjke-x-UE-unsplash-removebg-preview.png",
                      ),
                      _carbuild(
                        "2018 BMW 7 Series",
                        "Sedan",
                        "\$45,000",
                        "https://i.ibb.co/9996RWJZ/hyundai-motor-group-V1-DFo8-C4-JPA-unsplash-removebg-preview.png",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Image.network(
                        // Background image for BMW section
                        "https://i.ibb.co/jZbtb0Wz/chuttersnap-gts-Eh4g1lk-unsplash.jpg",
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error),
                      ),
                      Positioned.fill(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            VisibilityDetector(
                              key: _textKey,
                              onVisibilityChanged: (visibilityInfo) {
                                if (visibilityInfo.visibleFraction > 0.5) {
                                  // Restart animation when visible
                                  _animationController?.forward(from: 0);
                                } else {
                                  // Pause animation when not visible
                                  _animationController?.stop();
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150),
                                child: SizedBox(
                                  height: 200,
                                  width: 300,
                                  child: Text(
                                        "A speedometer tracks every second,\n every mile,"
                                        "urging you to chase your dreams with relentless drive."
                                        "When buying a car,\n choose one that matches your"
                                        "pace—fast enough to fuel your ambition,\n balanced"
                                        "to respect your limits.\n Let each tick of the needle"
                                        "inspire you to make every moment count on the road ahead.",

                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            146,
                                            151,
                                            146,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black54,
                                              offset: Offset(2, 2),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                      .animate(
                                        onInit: (controller) {
                                          _animationController = controller;
                                          controller.forward();
                                        },
                                        onPlay:
                                            (controller) => controller.repeat(
                                              reverse: false,
                                            ),
                                      )
                                      .fade(
                                        delay: 2000.milliseconds,
                                        duration: 4000.milliseconds,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Text("this page sel car and other car assc"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarCard(
    String title,
    String type,
    String price,
    String imageUrl,
  ) {
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

  Widget _carbuild(String title, String type, String price, String imageUrl) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 200,
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
}
