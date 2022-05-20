import 'package:brewery/business_logic/blocs/brewery_bloc.dart';
import 'package:brewery/data/models/breweryModel.dart';
import 'package:brewery/data/repositories/brewery_repository.dart';
import 'package:brewery/presentation/screens/breweryDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key, required this.breweryRepository}) : super(key: key);

  final BreweryRepository breweryRepository;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreweryBloc, BreweryState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? const Text('No Results')
              : Expanded(child: _SearchResults(items: state.items, breweryRepository: breweryRepository,));
        }
        return const Text('Please enter a term to begin');
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key, required this.items, required this.breweryRepository}) : super(key: key);

  final List<SearchResultItem> items;

  final BreweryRepository breweryRepository;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(item: items[index], breweryRepository: breweryRepository ,);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({Key? key, required this.item, required this.breweryRepository}) : super(key: key);

  final SearchResultItem item;

  final BreweryRepository breweryRepository;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(item.id),
      title: Text(item.name),
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BreweryDetails(id: item.id, breweryRepository: breweryRepository,);
          }),
        );
      },
    );
  }
}