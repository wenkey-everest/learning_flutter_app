import 'package:http/http.dart' as http;
import 'package:learning_flutter_app/domain/modals/article.dart';
import 'package:learning_flutter_app/domain/modals/news_response.dart';

class NewsApiService {
  Future<List<Article>> fetchNewsPosts() async {
    final url = Uri.https("newsapi.org", "v2/top-headlines",
        {"country": "us", "apiKey": "094a999f2ece434f8c36c945d8b8bbd6"});
    final response = await http.get(url);
    final responseBody = NewsResponse.fromJson(response.body);
    return responseBody.articles;
  }
}
