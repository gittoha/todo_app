import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/models/quotemodel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<QuoteModel> fetchQuotes() async {
    final response = await client.get('https://favqs.com/api/qotd');
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Quote');
    }
  }
}
