import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import 'providers/pantry_provider.dart';
import 'widgets/add_edit_item_dialog.dart';
import 'widgets/pantry_item_card.dart';

class PantryScreen extends ConsumerWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pantryProvider);
    final notifier = ref.read(pantryProvider.notifier);
    final currency = NumberFormat.simpleCurrency();

    Future<void> openItemDialog({dynamic item}) async {
      await showDialog<void>(
        context: context,
        builder: (_) => AddEditItemDialog(
          initialItem: item,
          onSave:
              ({
                required String name,
                required category,
                required double quantity,
                required String unit,
                required storageType,
                required DateTime expirationDate,
                double? cost,
                String? notes,
              }) {
                if (item == null) {
                  return notifier.addItem(
                    name: name,
                    category: category,
                    quantity: quantity,
                    unit: unit,
                    storageType: storageType,
                    expirationDate: expirationDate,
                    cost: cost,
                    notes: notes,
                  );
                }

                return notifier.updateItem(
                  itemId: item.id,
                  name: name,
                  category: category,
                  quantity: quantity,
                  unit: unit,
                  storageType: storageType,
                  expirationDate: expirationDate,
                  cost: cost,
                  notes: notes,
                );
              },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.eco, color: AppTheme.primaryGreen),
            SizedBox(width: 8),
            Text('SaveBite'),
          ],
        ),
        actions: [
          if (state.isDemoMode)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Center(child: Text('DEMO')),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openItemDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Add food'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Your kitchen, less waste.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text('Know what you have. Use it before it expires.'),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: 'In your pantry',
                  value: '${state.activeItems.length}',
                  icon: Icons.kitchen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _Metric(
                  label: 'Expiring soon',
                  value: '${state.expiringSoonItems.length}',
                  icon: Icons.schedule,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: 'Estimated saved',
                  value: currency.format(state.estimatedMoneySaved),
                  icon: Icons.savings_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _Metric(
                  label: 'Marked wasted',
                  value: currency.format(state.estimatedMoneyWasted),
                  icon: Icons.delete_outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search food',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: notifier.setSearchQuery,
          ),
          const SizedBox(height: 20),
          Text('Your pantry', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          if (state.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (state.filteredActiveItems.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text('No food items found. Add something to get started.'),
            )
          else
            ...state.filteredActiveItems.map(
              (item) => PantryItemCard(
                item: item,
                onConsumed: () {
                  final id = item.id;
                  if (id != null) {
                    notifier.markConsumed(id);
                  }
                },
                onWasted: () {
                  final id = item.id;
                  if (id != null) {
                    notifier.markWasted(id);
                  }
                },
                onEdit: () => openItemDialog(item: item),
                onDelete: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: const Text('Delete item?'),
                      content: Text('Remove ${item.name} from your pantry?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext, false),
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.pop(dialogContext, true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true) {
                    final id = item.id;
                    if (id != null) {
                      await notifier.deleteItem(id);
                    }
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppTheme.primaryGreen),
            const SizedBox(height: 10),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
