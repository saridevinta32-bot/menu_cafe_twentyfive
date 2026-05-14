import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, int> pesanan = {};
  String metodePilihan = 'Brimo';

  final List<Map<String, String>> dataMakanan = [
    {
      "nama": "Nasi Goreng Seafood",
      "harga": "22.000",
      "gambar": "assets/makanan/makan_nasgor_seafood.jpeg",
    },
    {
      "nama": "Spicy Beef Noodles",
      "harga": "19.000",
      "gambar": "assets/makanan/makan_spicy.jpeg",
    },
    {
      "nama": "Nasi Goreng Special",
      "harga": "25.000",
      "gambar": "assets/makanan/makan_nasgor_special.jpeg",
    },
    {
      "nama": "Bakmi Goreng",
      "harga": "15.000",
      "gambar": "assets/makanan/makan_bakmi.jpeg",
    },
    {
      "nama": "Ayam Bakar Madu",
      "harga": "25.000",
      "gambar": "assets/makanan/makan_ayam.jpeg",
    },
  ];

  final List<Map<String, String>> dataMinuman = [
    {
      "nama": "Matcha Latte",
      "harga": "18.000",
      "gambar": "assets/minuman/minum_matcha.jpeg",
    },
    {
      "nama": "Matcha Latte",
      "harga": "18.000",
      "gambar": "assets/minuman/minum_matcha.jpeg",
    },
    {
      "nama": "Thai Tea",
      "harga": "18.000",
      "gambar": "assets/minuman/minum_thaitea.jpeg",
    },
    {
      "nama": "Caramel Macchiato",
      "harga": "19.000",
      "gambar": "assets/minuman/minum_caramel.jpeg",
    },
    {
      "nama": "Es Kopi Susu",
      "harga": "16.000",
      "gambar": "assets/minuman/minum_eskopi.jpeg",
    },
    {
      "nama": "Signature Coklat",
      "harga": "19.000",
      "gambar": "assets/minuman/minum_signature.jpeg",
    },
    {
      "nama": "Mineral",
      "harga": "6.000",
      "gambar": "assets/minuman/minum_mineral.jpeg",
    },
  ];

  final List<Map<String, String>> dataCemilan = [
    {
      "nama": "Chicken Burger",
      "harga": "18.000",
      "gambar": "assets/cemilan/cemil_chicken.jpeg",
    },
    {
      "nama": "French Fries",
      "harga": "12.000",
      "gambar": "assets/cemilan/cemil_french.jpeg",
    },
    {
      "nama": "Sandwich Cheese",
      "harga": "18.000",
      "gambar": "assets/cemilan/cemil_sandwich.jpeg",
    },
    {
      "nama": "Dimsum",
      "harga": "15.000",
      "gambar": "assets/cemilan/cemil_dimsum.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Menu Cafe Twentyfive",
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.brown,
            indicatorColor: Colors.grey,
            tabs: [
              Tab(text: "Makanan"),
              Tab(text: "Minuman"),
              Tab(text: "Cemilan"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListMenu(dataMakanan),
            _buildListMenu(dataMinuman),
            _buildListMenu(dataCemilan),
          ],
        ),
      ),
    );
  }

  Widget _buildListMenu(List<Map<String, String>> data) {
    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.asset(
              data[index]['gambar']!,
              width: 50,
              errorBuilder: (c, e, s) => const Icon(Icons.fastfood),
            ),
            title: Text(data[index]['nama']!),
            subtitle: Text("Rp ${data[index]['harga']}"),
            trailing: const Icon(Icons.add_circle, color: Colors.brown),
          ),
        );
      },
    );
  }
}
