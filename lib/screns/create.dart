import 'package:crud_sqlite/database/database.dart';
import 'package:flutter/material.dart';


class CreateScreens extends StatefulWidget {
  const CreateScreens({super.key});



  @override
  State<CreateScreens> createState() => _CreateScrees1State();
}

class _CreateScrees1State extends State<CreateScreens> {
  final database = MyDatabase();
  TextEditingController nama = TextEditingController();
  TextEditingController tipetransaksi =  TextEditingController();
  TextEditingController nominal =  TextEditingController();

  Future insert(String nama, String tipetransaksi, int nominal) async {
    await database.into(database.todos).insert(TodosCompanion.insert(nama: nama, tipetransaksi: tipetransaksi, nominal: nominal));
  }

  // Future<List<Todo>> getAll() {
  //   return database.select(database.todos).get();
  // }

  // final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Create Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama"),
             TextFormField(
              controller: nama,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Masukan Pengeluaran"
              ),
            ),

            const SizedBox(height: 20,),

            const Text("Tipe Transaksi"),

             TextFormField(
              controller: tipetransaksi,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Masukan Pengeluaran"
              ),
            ),

            // ListTile(
            //   title: const Text("Pemasukan"),
            //   leading: Radio(value: 1, groupValue: _currentIndex, onChanged: (value){}),
            // ),

            // ListTile(
            //   title: const Text("Pengeluaran"),
            //   leading: Radio(value: 2, groupValue: _currentIndex, onChanged: (value){}),
            // ),

            const SizedBox(height: 20,),

            const Text("Total"),
             TextFormField(
              controller: nominal,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Masukan Nominal"
              ),
            ),

            const SizedBox(height: 30,),

            ElevatedButton(
              onPressed: (){
                insert(nama.text, tipetransaksi.text, int.parse(nominal.text));
                setState(() {});
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
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
