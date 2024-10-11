import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  final Map<String, dynamic> article;

  const NewsDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('dd MMM yyyy - HH:mm')
        .format(DateTime.parse(article['publishedAt']!));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News Details',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article['urlToImage'] != null)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(article['urlToImage']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              article['title'] ?? 'No Title Available',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Published on: $formattedTime',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              article['description'] ?? 'No Description Available',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (article['content'] != null)
              Text(
                article['content']!,
                style: const TextStyle(fontSize: 16),
              ),
            if (article['url'] != null)
              InkWell(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(article['url'].toString()))) {
                    throw Exception('Could not launch ${article['url']}');
                  }
                },
                child: Text(
                  article['url']!,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
