import 'package:crud_sqlite/custom_wigdet/custom_text.dart';
import 'package:crud_sqlite/database/database.dart';
import 'package:crud_sqlite/screns/create.dart';
import 'package:crud_sqlite/screns/update_scren.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const CrudApp());
}


class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kelola Duit",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final database = MyDatabase();
  Future <List<Todo>> getAll(){
    return database.select(database.todos).get();
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = Row(
      children: [
        TextButton(onPressed: (){Navigator.of(context, rootNavigator: true).pop('dialog');}, child: const Text("Batal")),
        const SizedBox(width: 15,),
        TextButton(onPressed: (){}, child: const Text("Simpan"))
      ],
    );

    AlertDialog alertDialog = AlertDialog(
      title: const Text("Peringatan"),
      content: const Text("Anda Yakin Ingin Menghapus"),
      actions: [okButton],
    );

    showDialog(context: context, builder: (BuildContext context) {
      return alertDialog;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("CRUD App"),
        actions: [IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateScreens()));
          }, 
          icon: const Icon(Icons.add)
        )
      ],
      ),
      body:  SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: FutureBuilder<List<Todo>>(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: const CircularProgressIndicator(),);
            }else{
            if (snapshot.hasData) {
              return ListTile(
                leading: const Icon(Icons.download, color: Colors.green,),
                title: const Text("Makan"),
                subtitle: const Text("Rp.2000"),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const UpdateScreen()));
                    }, icon: const Icon(Icons.edit)),
                    const SizedBox(width: 15,),
                    IconButton(onPressed: (){showAlertDialog(context);}, icon: const Icon(Icons.delete, color: Colors.red,))
                  ],
                ),
              );
            }else{
              return const Center(child: Text("Tidak ada data"),);
            }
            }
          },
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const PemasukanText("Total Pemasukan : Rp.1000"),
          //     const PengeluaranText("Total Pengeluaaran : Rp.1000"),
          
          //     const SizedBox(height: 30,),
          
          //     ListTile(
          //       leading: const Icon(Icons.download, color: Colors.green,),
          //       title: const Text("Makan"),
          //       subtitle: const Text("Rp.2000"),
          //       trailing: Wrap(
          //         children: [
          //           IconButton(onPressed: (){
          //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const UpdateScreen()));
          //           }, icon: const Icon(Icons.edit)),
          //           const SizedBox(width: 15,),
          //           IconButton(onPressed: (){showAlertDialog(context);}, icon: const Icon(Icons.delete, color: Colors.red,))
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      )
    ),
    );
  }
}

