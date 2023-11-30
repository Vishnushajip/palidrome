import 'package:flutter/material.dart';

void main() {
  runApp(PalindromeApp());
}

class PalindromeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PalindromeCheck(),
    );
  }
}

class PalindromeCheck extends StatefulWidget {
  @override
  _PalindromeCheckState createState() => _PalindromeCheckState();
}

class _PalindromeCheckState extends State<PalindromeCheck> {
  TextEditingController _textController = TextEditingController();
  bool _isPalindrome = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  bool checkPalindrome(String text) {
    String cleanText = text.toLowerCase().replaceAll(RegExp(r'[\W_]'), '');
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palindrome Checker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isPalindrome = checkPalindrome(_textController.text);
                });
              },
              child: Text('Check Palindrome'),
            ),
            SizedBox(height: 20),
            _isPalindrome
                ? Text(
              'Yes, it\'s a palindrome!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.green),
            )
                : Text(
              'No, it\'s not a palindrome.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
