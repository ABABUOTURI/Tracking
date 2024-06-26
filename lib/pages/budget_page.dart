import 'package:flutter/material.dart';
import '../models/budget.dart';
import 'add_budget_page.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final List<Budget> _budgets = [];

  void _addNewBudget(Budget budget) {
    setState(() {
      _budgets.add(budget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Your Budgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _budgets.length,
                itemBuilder: (context, index) {
                  final budget = _budgets[index];
                  return Card(
                    child: ListTile(
                      title: Text('Monthly Budget: Ksh.${budget.monthlyBudget.toStringAsFixed(2)}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: budget.categoryBudgets.map((categoryBudget) {
                          return Text('${categoryBudget.category}: Ksh.${categoryBudget.amount.toStringAsFixed(2)}');
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBudgetPage(onSave: _addNewBudget)),
                );
              },
              child: const Text('Add Budget'),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
