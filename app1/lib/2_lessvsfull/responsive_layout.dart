import 'package:flutter/material.dart';

class ResponsiveTodoList extends StatelessWidget {
  final List<Map<String, dynamic>> todos = List.generate(10, (i) => {
        'description': 'Tâche numéro ${i + 1}',
        'isComplete': i % 2 == 0 ? '✓' : '✗',
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste Responsive')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Changer la présentation selon la taille
          final isMobile = constraints.maxWidth < 600;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, idx) {
              final item = todos[idx];

              return Container(
                color: idx % 2 == 0 ? Colors.grey[200] : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['description'], style: const TextStyle(fontSize: 16)),
                          Text(item['isComplete'], style: const TextStyle(color: Colors.grey)),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['description'], style: const TextStyle(fontSize: 16)),
                          Text(item['isComplete'], style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
              );
            },
          );
        },
      ),
    );
  }
}