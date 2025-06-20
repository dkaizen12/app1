import 'package:flutter/material.dart';

/// Écran d’accueil (statique) affichant un message de bienvenue
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String username = 'Dady'; // Simule un nom utilisateur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        centerTitle: true,
      ),
      body: Center(
        child: WelcomeBanner(username: username),
      ),
    );
  }
}

/// Widget Stateless réutilisable qui affiche un message
class WelcomeBanner extends StatelessWidget {
  final String username;

  const WelcomeBanner({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        'Bienvenue, $username !',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
