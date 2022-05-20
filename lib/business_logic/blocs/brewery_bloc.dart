
import 'package:bloc/bloc.dart';
import 'package:brewery/data/models/breweryModel.dart';
import 'package:brewery/data/repositories/brewery_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';


part 'brewery_event.dart';
part 'brewery_state.dart';

const _duration = const Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class BreweryBloc extends Bloc<BreweryEvent, BreweryState> {
  BreweryBloc({required this.breweryRepository}) : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final BreweryRepository breweryRepository;

  void _onTextChanged(
      TextChanged event,
      Emitter<BreweryState> emit,
      ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());

    try {
      final results = await breweryRepository.search(searchTerm);
      emit(SearchStateSuccess(results.items));
    } catch (error) {
      emit(error is SearchResultError
          ? SearchStateError(error.message)
          : SearchStateError('something went wrong'));
    }
  }


}
