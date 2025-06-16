import 'dart:convert';
import 'package:http/http.dart' as http;

// Modèle de données
class Package {
  final String name;
  final String latestVersion;
  final String? description;

  Package(this.name, this.latestVersion, {this.description});

  @override
  String toString() {
    return 'Package{name: $name, latestVersion: $latestVersion, description: $description}';
  }
}

// Fonction pour récupérer et convertir les données du package
Future<Package> fetchPackageFromDartDev() async {
  final url = Uri.https('dart.dev', '/f/packages/http.json');
  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Échec de la récupération du package');
  }

  final data = jsonDecode(response.body);
  return Package(
    data['name'],
    data['latestVersion'],
    description: data['description'],
  );
}