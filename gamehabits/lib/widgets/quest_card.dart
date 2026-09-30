import 'package:flutter/material.dart';

class QuestCard extends StatelessWidget {
  final String title;
  final bool isMainQuest;
  final int expReward;
  final int coinReward;
  final bool isCompleted;
  final VoidCallback onClaim;

  const QuestCard({
    super.key,
    required this.title,
    required this.isMainQuest,
    required this.expReward,
    required this.coinReward,
    required this.isCompleted,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCompleted ? Colors.grey.shade300 : Colors.white,
      child: ListTile(
        title: Text(title),
        subtitle: Text('EXP: $expReward, Koin: $coinReward'),
        trailing: isCompleted
            ? const Icon(Icons.check, color: Colors.green)
            : ElevatedButton(onPressed: onClaim, child: const Text('Klaim')),
      ),
    );
  }
}
