import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: newsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <String>[
                        'Everything',
                        'business',
                        'entertainment',
                        'health',
                        'science',
                        'sports',
                        'technology',
                      ].map((category) {
                        return GestureDetector(
                          onTap: () {
                            newsProvider.changeCategory(category);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: newsProvider.selectedCategory == category
                                  ? Colors.blue
                                  : Colors.white38,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Text(
                                category[0].toUpperCase() +
                                    category.substring(1),
                                style: TextStyle(
                                  color:
                                      newsProvider.selectedCategory == category
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: newsProvider.searchNews,
                      decoration: InputDecoration(
                        hintText: 'Search News...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: newsProvider!.scrollController,
                      itemCount: newsProvider.filteredNews.length +
                          (newsProvider.morePageLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == newsProvider.filteredNews.length) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        var article = newsProvider.filteredNews[index];
                        var formattedTime = DateFormat('dd MMM - HH:mm')
                            .format(DateTime.parse(article['publishedAt']!));
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetailPage(article: article),
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(8),
                            child: Row(
                              children: <Widget>[
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: article['urlToImage'] == null
                                          ? const SizedBox()
                                          : Image.network(
                                              article['urlToImage']!,
                                              fit: BoxFit.cover,
                                            )),
                                ),
                                const SizedBox(width: 16),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(formattedTime),
                                      Text(
                                        article['title'] == null
                                            ? ""
                                            : article['title']!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        article['description'] == null
                                            ? ""
                                            : article['description']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                if (newsProvider.morePageLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
    );
  }
}
