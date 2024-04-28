import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Update Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama"),
            const TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Masukan Pengeluaran"
              ),
            ),

            const SizedBox(height: 20,),

            const Text("Tipe Transaksi"),

            ListTile(
              title: const Text("Pemasukan"),
              leading: Radio(value: 1, groupValue: _currentIndex, onChanged: (value){}),
            ),

            ListTile(
              title: const Text("Pengeluaran"),
              leading: Radio(value: 2, groupValue: _currentIndex, onChanged: (value){}),
            ),

            const SizedBox(height: 20,),

            const Text("Total"),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukan Nomina"
              ),
            ),

            const SizedBox(height: 30,),

            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                // foregroundColor: Colors.red,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                )
              ), 
              child: const Text("Simpan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
