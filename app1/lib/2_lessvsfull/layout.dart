import 'package:flutter/material.dart';

/// Widget principal qui montre l'utilisation de Row et Expanded
class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disposition Flex avec Row'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Une rangée (Row) de widgets étendus
        child: Row(
          children: const [
            // Bloc rouge : flex = 1
            Expanded(
              child: ColoredBoxWidget(
                color: Colors.red,
                label: '1x',
              ),
            ),
            // Bloc vert : flex = 2 (prend deux fois plus d’espace)
            Expanded(
              flex: 2,
              child: ColoredBoxWidget(
                color: Colors.green,
                label: '2x',
              ),
            ),
            // Bloc bleu : flex = 1
            Expanded(
              child: ColoredBoxWidget(
                color: Colors.blue,
                label: '1x',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget qui affiche un conteneur coloré avec une étiquette centrée
class ColoredBoxWidget extends StatelessWidget {
  final Color color;
  final String label;

  const ColoredBoxWidget({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Hauteur fixe
      color: color, // Couleur du bloc
      alignment: Alignment.center, // Centrage du texte
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}