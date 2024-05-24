import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryexplorer/view_model/view_model.dart';

import 'view/repo_list.dart';


void main() {
  // runApp(RepositoryExplorer());
  runApp(
    ChangeNotifierProvider(
      create: (context) => RepoViewModel(),
      child: RepositoryExplorer(),
    ),
  );
}

class RepositoryExplorer extends StatelessWidget {
  const RepositoryExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: TestRepoList(),
      home: RepoListScreen(),
    );
  }
}
