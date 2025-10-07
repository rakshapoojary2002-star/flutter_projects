import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/expense_provider.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  String? _selectedType;
  bool _isSaving = false;

  final List<String> types = ['Food', 'Travel', 'Bills', 'Shopping', 'Other'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Title field
              TextFormField(
                controller: _titleCtrl,
                decoration: const InputDecoration(labelText: "Title"),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                validator:
                    (value) =>
                        value == null || value.trim().isEmpty
                            ? "Enter a title"
                            : null,
              ),
              const SizedBox(height: 12),

              // Amount field
              TextFormField(
                controller: _amountCtrl,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: "Amount"),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty)
                    return "Enter amount";
                  if (double.tryParse(value) == null) return "Invalid number";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Type dropdown
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(labelText: "Type"),
                style: theme.textTheme.bodyMedium, // normal weight
                items:
                    types
                        .map(
                          (t) => DropdownMenuItem(
                            value: t,
                            child: Text(
                              t,
                              style:
                                  theme.textTheme.bodyMedium, // normal weight
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (val) => setState(() => _selectedType = val),
                validator: (val) => val == null ? "Select a type" : null,
              ),
              const SizedBox(height: 24),

              // Full width Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon:
                      _isSaving
                          ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.primary, // primary color
                              strokeWidth: 2,
                            ),
                          )
                          : const Icon(Icons.check),
                  label: Text(_isSaving ? "Saving..." : "Save"),
                  onPressed:
                      _isSaving
                          ? null
                          : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => _isSaving = true);
                              await Future.delayed(const Duration(seconds: 2));

                              Provider.of<ExpenseProvider>(
                                context,
                                listen: false,
                              ).add(
                                _titleCtrl.text.trim(),
                                double.parse(_amountCtrl.text.trim()),
                                _selectedType!,
                              );

                              setState(() => _isSaving = false);
                              Navigator.pop(context);
                            }
                          },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
