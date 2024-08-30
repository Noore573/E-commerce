import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<int> userIds = Get.arguments['userIds'];

    // Build the UI for the delete users screen
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Users'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'User IDs to Delete:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: userIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('User ID: ${userIds[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}