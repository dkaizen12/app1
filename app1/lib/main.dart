import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          Soir(), //home c'est pour tous ce qu'on verra sur l'interface souvent on écrit un statefull widget ici
    );
  }
}

class Soir extends StatefulWidget {
  @override
  State<Soir> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Soir> {
  var title = "Handler";

  List<_Cell> _index = [];
@override
  void initState() {
    _index = _Cell._getInfo();
    super.initState();
  }

  Widget table() {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            "Pays",
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            "Capitale",
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            "index",
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      rows: _index.map((_Cell) => DataRow(cells: [
        DataCell(Text(_Cell.pays)),
        DataCell(Text(_Cell.capital)),
        DataCell(Text(_Cell.index)),
      ])).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Leçon 30 : Data table (tableaux)"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(child: ListView(children: [table()])),
    );
  }
}

class _Cell {
  String pays ;
  String capital;
  String index;
  _Cell({ required this.pays, required this.capital, required this.index});
  static List<_Cell> _getInfo() {
    return <_Cell>[
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      _Cell(pays: "DRC", capital: "Kinshasa", index: "Tp Mazembe"),
      
    ];
  }
}