part of 'brewery_bloc.dart';

abstract class BreweryEvent extends Equatable {
  const BreweryEvent();
}

class TextChanged extends BreweryEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
