
import 'package:brewery/data/repositories/brewery_repository.dart';
import 'package:brewery/presentation/widget/searchBar.dart';
import 'package:brewery/presentation/widget/searchBody.dart';
import 'package:flutter/material.dart';

class AutoCompleteScreen extends StatelessWidget {

  const AutoCompleteScreen({Key? key, required this.breweryRepository}) : super(key: key);

  final BreweryRepository breweryRepository;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBar(),
        SearchBody(breweryRepository: breweryRepository,),
      ],
    );
  }
}