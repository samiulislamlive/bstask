import 'package:flutter/material.dart';

import '../model/gitModel.dart';

class RepoDetailsScreen extends StatelessWidget {
  final Items repo;

  RepoDetailsScreen({required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repo.name!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${repo.name!}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Owner: ${repo.owner?.login}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Description: ${repo.description ?? "No description"}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Last update: ${repo.updatedAt ?? "No description"}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
