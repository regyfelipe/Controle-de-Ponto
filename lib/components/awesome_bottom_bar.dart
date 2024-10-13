import 'package:flutter/material.dart';
import '../screens/bate_ponto_screen.dart';
import '../screens/registro_batida.dart';

class AwesomeBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AwesomeBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 3,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () {
              onTap(index);
              _navigateToScreen(context, index); 
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _items[index].icon,
                    color: isSelected ? Colors.white : Colors.white70,
                    size: isSelected ? 30 : 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _items[index].label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontSize: isSelected ? 13 : 11,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BatePontoScreen()),
        );
        break;
      case 1: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistroBatidaScreen()),
        );
        break;
      case 2: 
        break;
    }
  }
}

class BottomBarItem {
  final IconData icon;
  final String label;

  const BottomBarItem({required this.icon, required this.label});
}

const List<BottomBarItem> _items = [
  BottomBarItem(icon: Icons.access_time, label: 'Bater Ponto'),
  BottomBarItem(icon: Icons.history, label: 'Registro de Ponto'),
  BottomBarItem(icon: Icons.settings, label: 'Configurações'),
];
