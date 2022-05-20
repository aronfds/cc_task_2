part of 'brewery_bloc.dart';

abstract class BreweryState extends Equatable {
  const BreweryState();
}

class BreweryInitial extends BreweryState {
  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends BreweryState {

  @override
  List<Object> get props => [];
}

class SearchStateLoading extends BreweryState {

  @override
  List<Object> get props => [];
}

class SearchStateSuccess extends BreweryState {
  const SearchStateSuccess(this.items);

  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends BreweryState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
