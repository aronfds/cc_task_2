
import 'package:brewery/data/models/breweryModel.dart';
import 'package:brewery/data/repositories/brewery_client.dart';

import 'breweryCache.dart';

class BreweryRepository {
  const BreweryRepository(this.cache, this.client);

  final BreweryCache cache;
  final BreweryClient client;

  Future<SearchResult> search(String term) async {
    final cachedResult = cache.get(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.search(term);
    cache.set(term, result);
    return result;
  }


  Future<dynamic> breweryDetailsRepo(String id) async {
    final cachedResult = cache.getDetails(id);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.breweryDetails(id);
    cache.setDetails(id, result);
    return result;
  }
}