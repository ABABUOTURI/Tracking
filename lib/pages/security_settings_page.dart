import 'package:flutter/material.dart';

class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Security Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: const Text('Two-Factor Authentication'),
              subtitle: const Text('Enable or disable two-factor authentication.'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Enable/Disable logic here
                },
                child: const Text('Enable/Disable'),
              ),
            ),
            ListTile(
              title: const Text('Password Management'),
              subtitle: const Text('Change your password and manage security.'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to change password page or dialog
                },
                child: const Text('Manage'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Profile Page
              },
              child: const Text('Back to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
