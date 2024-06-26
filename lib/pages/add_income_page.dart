import 'package:flutter/material.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage(String s, {Key? key}) : super(key: key);

  @override
  _AddIncomePageState createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  late TextEditingController _dateController;
  late TextEditingController _amountController;
  late TextEditingController _descriptionController;
  String _selectedSource = '';
  final List<String> _incomeSources = ['Salary', 'Freelance', 'Investment', 'Other'];

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: _getCurrentDate());
    _amountController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Add Income'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Date field
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 20.0),

            // Amount field
            TextFormField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),

            // Source dropdown
            DropdownButtonFormField<String>(
              value: _selectedSource.isNotEmpty ? _selectedSource : null,
              onChanged: (value) {
                setState(() {
                  _selectedSource = value!;
                });
              },
              items: _incomeSources.map((source) {
                return DropdownMenuItem<String>(
                  value: source,
                  child: Text(source),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Source',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),

            // Description field
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),

            // Save and Cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _saveIncome();
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel and go back
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Method to select date using date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  // Method to save income data
  void _saveIncome() {
    String date = _dateController.text;
    String amount = _amountController.text;
    String description = _descriptionController.text;
    String source = _selectedSource;

    // Implement your logic to save income data here
    // For now, let's print the data
    print('Date: $date');
    print('Amount: $amount');
    print('Description: $description');
    print('Source: $source');

    // You can also navigate back to the previous page or home page
    Navigator.pop(context); // Navigate back to previous page
  }
}
