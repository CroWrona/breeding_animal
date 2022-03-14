import 'package:breeding/animal/database_animal.dart';
import 'package:breeding/animal/list_animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAnimal extends StatefulWidget {
  const MyAnimal({required this.index,Key? key, required this.title}) : super(key: key);
  final String title;
  final int index;

  @override
  State<MyAnimal> createState() => _MyAnimalState(index);
}

class _MyAnimalState extends State<MyAnimal> {
  _MyAnimalState(this.index);
  final index;

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
      animals = allAnimals;
    });
  }
  List<Animal> animals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: my_animal(),
    );
  }

  Widget my_animal() {
    return Container(
      alignment: Alignment.center,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('ID : ${data_Animals[index]['id']}', style: TextStyle(fontSize: 25),),
          Text('ANIMAL : ${data_Animals[index]['animal']}', style: TextStyle(fontSize: 25),),
          Text('NAME : ${animals[data_Animals[index]['animal']].name}', style: TextStyle(fontSize: 25),),
          Container(height: 100,width: 100, color: animals[data_Animals[index]['animal']].color,)
        ],
      ),
    );
  }
}