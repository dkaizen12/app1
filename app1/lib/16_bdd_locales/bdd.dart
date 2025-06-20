// 📁 dog_list_app.dart — fichier complet avec modèle, base de données et interface

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ============================
// 1. Modèle de données Dog
// ============================
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({required this.id, required this.name, required this.age});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(id: map['id'], name: map['name'], age: map['age']);
  }

  @override
  String toString() => 'Dog(id: $id, name: $name, age: $age)';
}

// ========================================
// 2. Service pour accéder à la base de données
// ========================================
class DogDatabase {
  static Database? _database;

  // Initialise ou retourne la base
  static Future<Database> get database async {
    if (_database != null) return _database!;
    WidgetsFlutterBinding.ensureInitialized();
    final path = join(await getDatabasesPath(), 'doggie_database.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
    );
    return _database!;
  }

  static Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Dog>> getDogs() async {
    final db = await database;
    final List<Map<String, Object?>> maps = await db.query('dogs');
    return maps.map((e) => Dog.fromMap(e as Map<String, dynamic>)).toList();
  }

  static Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}

// ===============================
// 3. Interface utilisateur (UI)
// ===============================
void main() {
  runApp(const MaterialApp(
    home: DogListView(),
    debugShowCheckedModeBanner: false,
  ));
}

class DogListView extends StatefulWidget {
  const DogListView({super.key});

  @override
  State<DogListView> createState() => _DogListViewState();
}

class _DogListViewState extends State<DogListView> {
  late Future<List<Dog>> _dogsFuture;

  @override
  void initState() {
    super.initState();
    _refreshDogs();
  }

  void _refreshDogs() {
    setState(() {
      _dogsFuture = DogDatabase.getDogs();
    });
  }

  void _addDummyDog() async {
    int id = DateTime.now().millisecondsSinceEpoch;
    await DogDatabase.insertDog(Dog(id: id, name: 'Chien $id', age: 1));
    _refreshDogs();
  }

  void _deleteDog(int id) async {
    await DogDatabase.deleteDog(id);
    _refreshDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Chiens'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshDogs,
          ),
        ],
      ),
      body: FutureBuilder<List<Dog>>(
        future: _dogsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: \${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun chien trouvé.'));
          }

          final dogs = snapshot.data!;
          return ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              final dog = dogs[index];
              return ListTile(
                leading: const Icon(Icons.pets),
                title: Text(dog.name),
                subtitle: Text('Âge : \${dog.age}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteDog(dog.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDummyDog,
        child: const Icon(Icons.add),
        tooltip: 'Ajouter un chien',
      ),
    );
  }
}
