import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../models/project_model.dart';

class GithubService {
  final String username;

  GithubService({required this.username});

  Future<List<Project>> fetchRepos() async {
    final url = Uri.parse("https://api.github.com/users/$username/repos");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((repo) {
        return Project(
          title: repo['name'] ?? "No name",
          description: repo['description'] ?? "No description available",
          projectUrl: repo['html_url'],
          imageUrl:
          "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png",
        );
      }).toList();
    } else {
      throw Exception("Failed to load GitHub repos");
    }
  }
}
