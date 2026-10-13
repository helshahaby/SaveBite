import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savebite_client/savebite_client.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/urgency_helper.dart';

class AddEditItemDialog extends StatefulWidget {
  final PantryItem? initialItem;
  final Future<bool> Function({
    required String name,
    required FoodCategory category,
    required double quantity,
    required String unit,
    required StorageType storageType,
    required DateTime expirationDate,
    double? cost,
    String? notes,
  })
  onSave;

  const AddEditItemDialog({
    super.key,
    this.initialItem,
    required this.onSave,
  });

  @override
  State<AddEditItemDialog> createState() => _AddEditItemDialogState();
}

class _AddEditItemDialogState extends State<AddEditItemDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _quantityController;
  late TextEditingController _unitController;
  late TextEditingController _costController;
  late TextEditingController _notesController;

  late FoodCategory _category;
  late StorageType _storageType;
  late DateTime _expirationDate;
  bool _isSaving = false;

  final _commonUnits = [
    'pcs',
    'g',
    'kg',
    'liter',
    'ml',
    'pack',
    'tub',
    'can',
    'loaf',
    'bag',
  ];

  @override
  void initState() {
    super.initState();
    final item = widget.initialItem;

    _nameController = TextEditingController(text: item?.name ?? '');
    _quantityController = TextEditingController(
      text: item != null ? _formatNum(item.quantity) : '1',
    );
    _unitController = TextEditingController(text: item?.unit ?? 'pcs');
    _costController = TextEditingController(
      text: item?.cost != null ? item!.cost!.toStringAsFixed(2) : '',
    );
    _notesController = TextEditingController(text: item?.notes ?? '');

    _category = item?.category ?? FoodCategory.produce;
    _storageType = item?.storageType ?? StorageType.fridge;
    _expirationDate =
        item?.expirationDate ?? DateTime.now().add(const Duration(days: 5));
  }

  String _formatNum(double n) =>
      n == n.roundToDouble() ? n.toInt().toString() : n.toString();

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    _costController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _applyExpiryPreset(int days) {
    setState(() {
      _expirationDate = DateTime.now().add(Duration(days: days));
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expirationDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
    );
    if (picked != null) {
      setState(() {
        _expirationDate = picked;
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    final costVal = double.tryParse(_costController.text.trim());

    final success = await widget.onSave(
      name: _nameController.text.trim(),
      category: _category,
      quantity: double.parse(_quantityController.text.trim()),
      unit: _unitController.text.trim().isEmpty
          ? 'pcs'
          : _unitController.text.trim(),
      storageType: _storageType,
      expirationDate: _expirationDate,
      cost: costVal,
      notes: _notesController.text.trim(),
    );

    if (mounted) {
      setState(() => _isSaving = false);
      if (success) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialItem != null;
    final dateStr = DateFormat.yMMMd().format(_expirationDate);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520, maxHeight: 720),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEdit ? 'Edit Food Item' : 'Add Food Item',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Item Name *',
                    hintText: 'e.g. Sourdough Bread, Fresh Spinach',
                    prefixIcon: Icon(Icons.fastfood_outlined),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Please enter the item name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Category & Storage
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<FoodCategory>(
                        initialValue: _category,
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          prefixIcon: Icon(Icons.category_outlined),
                        ),
                        items: FoodCategory.values.map((cat) {
                          return DropdownMenuItem(
                            value: cat,
                            child: Row(
                              children: [
                                Icon(
                                  UrgencyHelper.getCategoryIcon(cat),
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(UrgencyHelper.getCategoryName(cat)),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _category = val);
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<StorageType>(
                        initialValue: _storageType,
                        decoration: const InputDecoration(
                          labelText: 'Storage',
                          prefixIcon: Icon(Icons.kitchen_outlined),
                        ),
                        items: StorageType.values.map((st) {
                          return DropdownMenuItem(
                            value: st,
                            child: Row(
                              children: [
                                Icon(
                                  UrgencyHelper.getStorageIcon(st),
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(UrgencyHelper.getStorageName(st)),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _storageType = val);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Quantity & Unit
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _quantityController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Quantity *',
                          prefixIcon: Icon(Icons.scale_outlined),
                        ),
                        validator: (v) {
                          final parsed = double.tryParse(v ?? '');
                          if (parsed == null || parsed <= 0) {
                            return 'Enter > 0';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        initialValue:
                            _commonUnits.contains(_unitController.text)
                            ? _unitController.text
                            : 'pcs',
                        decoration: const InputDecoration(
                          labelText: 'Unit',
                        ),
                        items: _commonUnits.map((u) {
                          return DropdownMenuItem(value: u, child: Text(u));
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            _unitController.text = val;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Expiry Date Section
                const Text(
                  'Expiry Date *',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(height: 6),
                InkWell(
                  onTap: _pickDate,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppTheme.borderLight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: AppTheme.primaryGreen,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              dateStr,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          UrgencyHelper.getUrgencyLabel(_expirationDate),
                          style: TextStyle(
                            color: UrgencyHelper.getUrgencyColor(
                              _expirationDate,
                            ),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Expiry quick presets
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _presetChip('+2 Days', 2),
                    _presetChip('+5 Days', 5),
                    _presetChip('+1 Week', 7),
                    _presetChip('+2 Weeks', 14),
                    _presetChip('+1 Month', 30),
                  ],
                ),
                const SizedBox(height: 14),

                // Cost & Notes
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _costController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Estimated Cost (\$)',
                          prefixText: '\$ ',
                          hintText: '3.50',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _notesController,
                        decoration: const InputDecoration(
                          labelText: 'Notes / Tips',
                          hintText: 'e.g. In crisper drawer',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Save button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _submit,
                    child: _isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(isEdit ? 'Save Changes' : 'Add to Pantry'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _presetChip(String label, int days) {
    return ActionChip(
      label: Text(label, style: const TextStyle(fontSize: 11)),
      onPressed: () => _applyExpiryPreset(days),
      backgroundColor: AppTheme.surfaceLight,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      side: const BorderSide(color: AppTheme.borderLight),
    );
  }
}
