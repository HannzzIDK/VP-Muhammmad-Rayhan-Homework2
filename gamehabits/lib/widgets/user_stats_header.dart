import 'package:flutter/material.dart';

class UserStatsHeader extends StatelessWidget {
  final int level;
  final int exp;
  final int coins;

  const UserStatsHeader({
    super.key,
    required this.level,
    required this.exp,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Level: $level',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('EXP: $exp / 100'),
          Text('Koin: $coins'),
        ],
      ),
    );
  }
}
