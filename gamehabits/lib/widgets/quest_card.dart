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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      elevation: isCompleted ? 0 : 2,
      color: isCompleted ? colorScheme.surfaceContainerHighest : colorScheme.surface,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        
        title: Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: isCompleted ? colorScheme.outline : colorScheme.onSurface,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isMainQuest ? colorScheme.errorContainer : colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isMainQuest ? 'MAIN' : 'SIDE',
                  style: textTheme.labelSmall?.copyWith(
                    color: isMainQuest ? colorScheme.onErrorContainer : colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '+$expReward EXP  •  $coinReward Koin',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        
        trailing: isCompleted
            ? Icon(Icons.check_circle, color: colorScheme.primary, size: 32)
            : FilledButton.tonal(
                onPressed: onClaim,
                child: const Text('Klaim'),
              ),
      ),
    );
  }
}
