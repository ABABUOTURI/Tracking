import 'package:flutter/material.dart';
//import 'package:expensetrack/models/expense.dart';
import 'package:tracking/models/expense.dart';

class AddExpensePage extends StatelessWidget {
  final Function(Expense) addExpense;
  final int categoryId;

  AddExpensePage(void Function(Expense expense) param0, String s, 
  {
    required this.addExpense,
     required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Expense Name'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String title = titleController.text;
                final double amount = double.parse(amountController.text);
                final Expense newExpense = Expense(
                  title: title,
                  amount: amount,
                  categoryId: categoryId,
                );
                addExpense(newExpense);
                Navigator.of(context).pop();
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
