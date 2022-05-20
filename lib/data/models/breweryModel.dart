

class SearchResult {
  const SearchResult({required this.items});

  final List<SearchResultItem> items;

  static SearchResult fromJson(List<dynamic> json) {
    final items = json
        .map((dynamic item) =>
        SearchResultItem.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult(items: items);
  }
}

class SearchResultError {
  const SearchResultError({required this.message});

  final String message;

  static SearchResultError fromJson(dynamic json) {
    return SearchResultError(
      message: json['message'] as String,
    );
  }
}

class SearchResultItem {
  const SearchResultItem({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
