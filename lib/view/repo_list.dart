// Import necessary packages and files
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryexplorer/view/repoDetailsScreen.dart';
import 'package:repositoryexplorer/view_model/view_model.dart';

import '../model/gitModel.dart';

class RepoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RepoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flutter Repositories'),
        centerTitle: true,
      ),
      body: FutureBuilder<GitStarModel>(
        future: viewModel.getRepositories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return Center(child: CircularProgressIndicator());

          } else if (snapshot.hasError) {

            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.items!.isEmpty) {

            return Center(child: Text('No repositories found'));
          } else {
            final repos = snapshot.data!.items!;
            return ListView.builder(
              itemCount: repos.length,

              itemBuilder: (context, index) {
                final repo = repos[index];
                return Padding(

                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(repo.owner!.avatarUrl!),
                      ),
                      title: Text(repo.name!),
                      subtitle: Text('Owner: ${repo.owner!.login!}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 10),
                          Text('${repo.stargazersCount}'),
                        ],
                      ),
                      onTap: () {
                        if(kDebugMode){
                          print("clicked data ${repo}");
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepoDetailsScreen(repo: repo),
                          ),
                        );
                        // Navigate to details screen
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
