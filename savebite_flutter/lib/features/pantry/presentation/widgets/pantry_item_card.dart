import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savebite_client/savebite_client.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/urgency_helper.dart';

class PantryItemCard extends StatelessWidget {
  final PantryItem item;
  final VoidCallback onConsumed;
  final VoidCallback onWasted;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PantryItemCard({
    super.key,
    required this.item,
    required this.onConsumed,
    required this.onWasted,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final urgencyColor = UrgencyHelper.getUrgencyColor(item.expirationDate);
    final urgencyBg = UrgencyHelper.getUrgencyBackgroundColor(
      item.expirationDate,
    );
    final urgencyLabel = UrgencyHelper.getUrgencyLabel(item.expirationDate);
    final categoryIcon = UrgencyHelper.getCategoryIcon(item.category);
    final storageName = UrgencyHelper.getStorageName(item.storageType);
    final storageIcon = UrgencyHelper.getStorageIcon(item.storageType);

    final currencyFormat = NumberFormat.simpleCurrency();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category icon container
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: urgencyBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    categoryIcon,
                    color: urgencyColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),

                // Title, quantity & storage info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Urgency Chip
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: urgencyBg,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: urgencyColor.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              urgencyLabel,
                              style: TextStyle(
                                color: urgencyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        runSpacing: 4,
                        children: [
                          // Quantity
                          Text(
                            '${_formatQuantity(item.quantity)} ${item.unit}',
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Storage location
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                storageIcon,
                                size: 14,
                                color: AppTheme.textMuted,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                storageName,
                                style: const TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          // Estimated Cost
                          if (item.cost != null)
                            Text(
                              currencyFormat.format(item.cost),
                              style: const TextStyle(
                                color: AppTheme.primaryGreenDark,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                      if (item.notes != null && item.notes!.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          item.notes!,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: AppTheme.borderLight),
            const SizedBox(height: 8),

            // Action row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onConsumed,
                    icon: const Icon(
                      Icons.check_circle_outline,
                      size: 18,
                      color: AppTheme.freshEmerald,
                    ),
                    label: const Text(
                      'Used / Consumed',
                      style: TextStyle(
                        color: AppTheme.freshEmerald,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppTheme.freshEmerald.withValues(alpha: 0.3),
                      ),
                      backgroundColor: AppTheme.freshEmeraldLight.withValues(
                        alpha: 0.4,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onWasted,
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: AppTheme.alertRed,
                    ),
                    label: const Text(
                      'Wasted',
                      style: TextStyle(
                        color: AppTheme.alertRed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppTheme.alertRed.withValues(alpha: 0.3),
                      ),
                      backgroundColor: AppTheme.alertRedLight.withValues(
                        alpha: 0.3,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                PopupMenuButton<String>(
                  onSelected: (val) {
                    if (val == 'edit') onEdit();
                    if (val == 'delete') onDelete();
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, size: 18),
                          SizedBox(width: 8),
                          Text('Edit Item'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_forever_outlined,
                            size: 18,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Delete Permanently',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatQuantity(double q) {
    if (q == q.roundToDouble()) {
      return q.toInt().toString();
    }
    return q.toStringAsFixed(1);
  }
}
