import 'package:flutter/material.dart';

/// Ce StatefulWidget démontre tout le cycle de vie
class WidgetCycleDemo extends StatefulWidget {
  const WidgetCycleDemo({super.key});

  @override
  State<WidgetCycleDemo> createState() => _WidgetCycleDemoState();
}

class _WidgetCycleDemoState extends State<WidgetCycleDemo> {
  int counter = 0;

  /// Appelée une seule fois lors de la création de l’état
  @override
  void initState() {
    super.initState();
    debugPrint('📥 initState() appelé');
  }

  /// Appelée si le contexte hérité change (ex: Theme)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('🔁 didChangeDependencies() appelé');
  }

  /// Appelée à chaque mise à jour de l’UI
  @override
  Widget build(BuildContext context) {
    debugPrint('🛠️ build() appelé avec counter=$counter');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cycle de vie du StatefulWidget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compteur : $counter',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('🧠 setState() déclenché');
                setState(() {
                  counter++;
                });
              },
              child: const Text('Incrémenter'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('🧹 Naviguer vers une autre page (dispose imminent)');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SecondPage(),
                  ),
                );
              },
              child: const Text('Aller à une autre page'),
            ),
          ],
        ),
      ),
    );
  }

  /// Appelée juste avant que le widget ne soit retiré de l’arbre
  @override
  void deactivate() {
    super.deactivate();
    debugPrint('🚫 deactivate() appelé');
  }

  /// Appelée une seule fois lorsque le widget est supprimé
  @override
  void dispose() {
    debugPrint('❌ dispose() appelé');
    super.dispose();
  }
}

/// Une seconde page simple pour forcer le retrait du premier widget
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('📄 SecondPage build()');
    return Scaffold(
      appBar: AppBar(title: const Text('Seconde page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Retour'),
        ),
      ),
    );
  }
}