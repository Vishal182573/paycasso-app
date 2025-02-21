import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/routes.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  void _onItemTapped(int index) {
    widget.onIndexChanged(index);

    // Use pushReplacementNamed to replace the current screen instead of stacking
    switch (index) {
      case 0:
        if (widget.currentIndex != 0) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
        break;
      case 1:
        if (widget.currentIndex != 1) {
          Navigator.pushReplacementNamed(context, AppRoutes.paycassoCommunity);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.home,
            isSelected: widget.currentIndex == 0,
            onTap: () => _onItemTapped(0),
          ),
          _NavBarItem(
            icon: Icons.currency_pound_outlined,
            isSelected: widget.currentIndex == 1,
            onTap: () => _onItemTapped(1),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: isSelected ? Colors.purple[200] : Colors.grey[400],
        size: 28,
      ),
    );
  }
}
