import 'package:flutter/material.dart';

class DeleteProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build the UI for the delete products screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Products'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Text('This is the Delete Products screen.'),
      ),
    );
  }
}