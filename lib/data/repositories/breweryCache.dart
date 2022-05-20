

import 'package:brewery/data/models/breweryModel.dart';

class BreweryCache {
  final _cache = <String, SearchResult>{};
  SearchResult? get(String term) => _cache[term];
  void set(String term, SearchResult result) => _cache[term] = result;
  bool contains(String term) => _cache.containsKey(term);
  void remove(String term) => _cache.remove(term);


  final _cacheDetails = <String, dynamic>{};
  dynamic getDetails(String id) => _cacheDetails[id];
  void setDetails(String id, dynamic result) => _cacheDetails[id] = result;
  bool containsDetails(String id) => _cacheDetails.containsKey(id);
  void removeDetails(String id) => _cacheDetails.remove(id);
}