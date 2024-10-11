import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/services/api_services.dart';

import '../constants/constant.dart';

class NewsProvider with ChangeNotifier {
  int pageCount = 1;
  List headlineNews = [];
  List filteredNews = [];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool morePageLoading = false;
  String searchQuery = "";
  final List<String> categories = [
    'All',
    'Sports',
    'Technology',
    'Health',
    'Entertainment'
  ];

  NewsProvider() {
    fetchTopHeadlines();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchMoreHeadlines();
      }
    });
  }
  String selectedCategory = "Everything";

  Future<void> fetchTopHeadlines() async {
    setLoading(true);
    var response = await ApiServices().fetchData(
        "${selectedCategory == "Everything" ? "" : "&category=$selectedCategory"}${Strings.API_KEY}${Strings.ApiPages}$pageCount");

    log(response.toString());

    if (response['status'] == "ok") {
      headlineNews = response['articles'] ?? [];
      filteredNews = headlineNews;
    }
    setLoading(false);
  }

  void changeCategory(String category) {
    headlineNews.clear();
    filteredNews.clear();
    pageCount = 1;
    searchQuery = "";

    selectedCategory = category;

    fetchTopHeadlines();
    notifyListeners();
  }

  Future<void> fetchMoreHeadlines() async {
    if (morePageLoading) return;
    setMorePageLoading(true);
    pageCount++;
    var response = await ApiServices()
        .fetchData("${Strings.API_KEY}${Strings.ApiPages}$pageCount");

    if (response['status'] == "ok") {
      headlineNews.addAll(response['articles']);
      filteredNews = headlineNews;
    }
    setMorePageLoading(false);
  }

  void searchNews(String query) {
    searchQuery = query;
    filteredNews = headlineNews
        .where((article) =>
            article['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setMorePageLoading(bool value) {
    morePageLoading = value;
    notifyListeners();
  }
}
