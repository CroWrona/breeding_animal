import 'dart:math';
import 'package:breeding/animal/database_animal.dart';
import 'package:breeding/animal/list_animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_animal.dart';

class MyBreeding extends StatefulWidget {
  const MyBreeding({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyBreeding> createState() => _MyBreedingState();
}

class _MyBreedingState extends State<MyBreeding> {

  List<Map<String, dynamic>> data_Animals = [];

  @override
  void initState() {
    super.initState();
    load_data_breeding();
  }

  void load_data_breeding() async {
    final data = await SQLHelperAnimals.getItems();
    setState(() {
      data_Animals = data;
    });
  }

  Future<void> add_animal() async {
    Random random = new Random();
    late List<Animal> animals;
    animals = allAnimals;
    int random_id_animal = random.nextInt(animals.length-1);
    await SQLHelperAnimals.createItem(random_id_animal+1);
    load_data_breeding();
  }

  Future<void> edit_animal(int id) async {
    Random random = new Random();
    late List<Animal> animals;
    animals = allAnimals;
    int random_id_animal = random.nextInt(animals.length-1);
    await SQLHelperAnimals.updateItem(id+1, random_id_animal+1);
    load_data_breeding();
  }

  Future<void> delate_animal(int id) async {
    await SQLHelperAnimals.updateItem(id+1, 0);
    load_data_breeding();
  }

  // void delate_animal(int id) async {
  //   await SQLHelperAnimals.deleteItem(id);
  //   breeding();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: my_breeding_list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {await add_animal();},
        tooltip: 'add animal',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget my_breeding_list() {
    return ListView.builder(
        itemCount: data_Animals.length,
        itemBuilder: (context, index) =>
            Card(
                child: ListTile(
                  //leading: Text('${data_Animals[index]['id']}', style: TextStyle(fontSize: 25),),

                  leading:IconButton(icon: const Icon(Icons.edit), onPressed: () async {await edit_animal(index);},),
                  trailing:IconButton(icon: const Icon(Icons.delete), onPressed: () async {await delate_animal(index);},),
                  title: Text(data_Animals[index]['animal']>0 ? 'ID : ${data_Animals[index]['id']}\nAnimal : ${data_Animals[index]['animal']}' : 'ID : ${data_Animals[index]['id']}'),
                  onTap: () {
                    if(data_Animals[index]['animal']>0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyAnimal(index: index, title: 'Animal',)));
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no animal'),));
                    }
                  },
                )
            )
    );
  }
}