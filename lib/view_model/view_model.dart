import 'package:flutter/material.dart';
import 'package:repositoryexplorer/repository/repository.dart';

import '../model/gitModel.dart';

class RepoViewModel extends ChangeNotifier {
  final Repository _repository = Repository();

  Future<GitStarModel> getRepositories() async {
    return await _repository.fetchRepositories('flutter');
  }
}
