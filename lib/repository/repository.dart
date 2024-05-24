import 'package:flutter/foundation.dart';
import 'package:repositoryexplorer/service/service.dart';

import '../model/gitModel.dart';

class Repository {
  final GitHubService _gitHubService = GitHubService();

  Future<GitStarModel> fetchRepositories(String query) async {
    final data = await _gitHubService.fetchRepositories(query);
    if(kDebugMode){
      print("gitstarmodel ${data}");
    }
    return GitStarModel.fromJson(data);
  }
}
