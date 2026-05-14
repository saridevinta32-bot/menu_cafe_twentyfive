import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: const HomePage()),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

class _HomePageState extends State<HomePage> {
  Map<String, int> pesanan = {};
  String metodePilihan = 'Brimo';

  final List<Map<String, String>> dataMakanan = [

  ]
}
}
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo_cafe_twentyfive.png', height: 50),
                  const Text(
                    "meja: 4",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001F5B),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, indent: 20, endIndent: 20),
          ],
        ),
      ),
    );
  }
}
