import 'package:brewery/data/repositories/breweryCache.dart';
import 'package:brewery/data/repositories/brewery_client.dart';
import 'package:brewery/data/repositories/brewery_repository.dart';
import 'package:brewery/presentation/screens/autoCompleteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/blocs/brewery_bloc.dart';

//https://api.openbrewerydb.org/breweries/ Base URL
//dev: flutter run --flavor dev --dart-define=BASE_URL=https://api.openbrewerydb.org/breweries/
//prod: flutter run --flavor prod --dart-define=BASE_URL=https://api.openbrewerydb.org/breweries/

void main() {
  final BreweryRepository repository = BreweryRepository(
    BreweryCache(),
    BreweryClient(),
  );

  runApp(App(breweryRepository: repository));
}

class App extends StatelessWidget {
  const App({Key? key, required this.breweryRepository}) : super(key: key);

  final BreweryRepository breweryRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brewery',
      home: Scaffold(
        appBar: AppBar(title: const Text('Brewery')),
        body: BlocProvider(
          create: (_) => BreweryBloc(breweryRepository: breweryRepository),
          child: AutoCompleteScreen(breweryRepository: breweryRepository,),
        ),
      ),
    );
  }
}