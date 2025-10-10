// lib/widgets/auth_toggle_buttons.dart

import 'package:flutter/material.dart';

class AuthToggleButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const AuthToggleButtons({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          _buildButton(label: 'Login', index: 0),
          _buildButton(label: 'Register', index: 1),
        ],
      ),
    );
  }

  Widget _buildButton({required String label, required int index}) {
    bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChange(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected ? const Color(0xFF3A82F8) : Colors.grey[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
