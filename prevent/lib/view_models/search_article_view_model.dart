import 'package:flutter/material.dart';

class SearchArticleViewModel extends ChangeNotifier {
  List<String> allData = [
    'Indonesia',
    'Rusia',
    'America',
    'Italy',
    'France',
    'England',
    'Singapore',
    'Germany',
    'Spain',
    'Australia',
    'China',
    'Japan',
    'Canada',
    'Mexico',
    'Brazil',
    'Argentina',
    'India',
    'South Korea',
    'Thailand',
    'Netherlands',
    'Belgium',
    'Sweden',
    'Switzerland',
    'Norway',
    'Denmark',
    'Greece',
    'Egypt',
    'Turkey',
    'Saudi Arabia',
    'United Arab Emirates',
  ];

  List<String> _filteredData = [];
  List<String> get filteredData => _filteredData;

  void filterData(String keyword) {
    _filteredData = allData
        .where((data) => data.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
