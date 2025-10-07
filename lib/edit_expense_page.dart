import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/expense_provider.dart';

class EditExpensePage extends StatefulWidget {
  final String expenseId;

  const EditExpensePage({super.key, required this.expenseId});

  @override
  State<EditExpensePage> createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleCtrl;
  late TextEditingController _amountCtrl;
  String? _selectedType;
  bool _isUpdating = false;

  final List<String> types = ['Food', 'Travel', 'Bills', 'Shopping', 'Other'];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ExpenseProvider>(context, listen: false);
    final expense = provider.getById(widget.expenseId)!;
    _titleCtrl = TextEditingController(text: expense.title);
    _amountCtrl = TextEditingController(text: expense.amount.toString());
    _selectedType = expense.type;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context, listen: false);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Expense")),
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
                style: theme.textTheme.bodyMedium,
                items:
                    types
                        .map(
                          (t) => DropdownMenuItem(
                            value: t,
                            child: Text(t, style: theme.textTheme.bodyMedium),
                          ),
                        )
                        .toList(),
                onChanged: (val) => setState(() => _selectedType = val),
                validator: (val) => val == null ? "Select a type" : null,
              ),
              const SizedBox(height: 24),

              // Full width Update button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon:
                      _isUpdating
                          ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              color:
                                  theme
                                      .colorScheme
                                      .primary, // primary color for spinner
                              strokeWidth: 2,
                            ),
                          )
                          : const Icon(Icons.save),
                  label: Text(_isUpdating ? "Updating..." : "Update"),
                  onPressed:
                      _isUpdating
                          ? null
                          : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => _isUpdating = true);
                              await Future.delayed(const Duration(seconds: 2));

                              provider.updateExpense(
                                widget.expenseId,
                                _titleCtrl.text.trim(),
                                double.parse(_amountCtrl.text.trim()),
                                _selectedType!,
                              );

                              setState(() => _isUpdating = false);
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
