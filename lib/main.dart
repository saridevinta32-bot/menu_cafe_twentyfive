import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Cafe 25',
      home: HomePage(),
    ),
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
      "harga": "22000",
      "gambar": "assets/makanan/makan_nasgor_seafood.jpeg",
    },
    {
      "nama": "Spicy Beef Noodles",
      "harga": "19000",
      "gambar": "assets/makanan/makan_spicy.jpeg",
    },
    {
      "nama": "Nasi Goreng Special",
      "harga": "25000",
      "gambar": "assets/makanan/makan_nasgor_special.jpeg",
    },
    {
      "nama": "Bakmi Goreng",
      "harga": "15000",
      "gambar": "assets/makanan/makan_bakmi.jpeg",
    },
    {
      "nama": "Ayam Bakar Madu",
      "harga": "25000",
      "gambar": "assets/makanan/makan_ayam.jpeg",
    },
  ];

  final List<Map<String, String>> dataMinuman = [
    {
      "nama": "Matcha Latte",
      "harga": "18000",
      "gambar": "assets/minuman/minum_matcha.jpeg",
    },
    {
      "nama": "Thai Tea",
      "harga": "18000",
      "gambar": "assets/minuman/minum_thaitea.jpeg",
    },
    {
      "nama": "Caramel Macchiato",
      "harga": "19000",
      "gambar": "assets/minuman/minum_caramel.jpeg",
    },
    {
      "nama": "Es Kopi Susu",
      "harga": "16000",
      "gambar": "assets/minuman/minum_eskopi.jpeg",
    },
    {
      "nama": "Signature Coklat",
      "harga": "19000",
      "gambar": "assets/minuman/minum_signature.jpeg",
    },
    {
      "nama": "Mineral",
      "harga": "6000",
      "gambar": "assets/minuman/minum_mineral.jpeg",
    },
  ];

  final List<Map<String, String>> dataCemilan = [
    {
      "nama": "Chicken Burger",
      "harga": "18000",
      "gambar": "assets/cemilan/cemil_chicken.jpeg",
    },
    {
      "nama": "French Fries",
      "harga": "12000",
      "gambar": "assets/cemilan/cemil_french.jpeg",
    },
    {
      "nama": "Sandwich Cheese",
      "harga": "18000",
      "gambar": "assets/cemilan/cemil_sandwich.jpeg",
    },
    {
      "nama": "Dimsum",
      "harga": "15000",
      "gambar": "assets/cemilan/cemil_dimsum.jpeg",
    },
  ];

  int hitungTotal() {
    int total = 0;
    List<Map<String, String>> semuaMenu = [
      ...dataMakanan,
      ...dataMinuman,
      ...dataCemilan,
    ];

    pesanan.forEach((nama, jumlah) {
      if (jumlah > 0) {
        var item = semuaMenu.firstWhere((element) => element['nama'] == nama);
        total += int.parse(item['harga']!) * jumlah;
      }
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    int totalHarga = hitungTotal();
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

        bottomNavigationBar: totalHarga > 0
            ? Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Metode Pembayaran",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "Total: Rp $totalHarga",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HalamanSukses(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Bayar via $metodePilihan",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildListMenu(List<Map<String, String>> data) {
    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        String nama = data[index]['nama']!;
        int qty = pesanan[nama] ?? 0;
        return Card(
          child: ListTile(
            leading: Image.asset(
              data[index]['gambar']!,
              width: 50,
              errorBuilder: (c, e, s) => const Icon(Icons.fastfood),
            ),
            title: Text(data[index]['nama']!),
            subtitle: Text("Rp ${data[index]['harga']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (qty > 0)
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        String nama = data[index]['nama']!;
                        pesanan[nama] = qty - 1;
                      });
                    },
                  ),
                if (qty > 0) Text("$qty"),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blueAccent),
                  onPressed: () {
                    setState(() {
                      String nama = data[index]['nama']!;
                      pesanan[nama] = qty + 1;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HalamanSukses extends StatelessWidget {
  const HalamanSukses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Oke, pesanan akan kami siapkan!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
