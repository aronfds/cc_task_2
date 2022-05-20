import 'package:brewery/data/repositories/brewery_repository.dart';
import 'package:flutter/material.dart';

class BreweryDetails extends StatelessWidget {
  BreweryDetails({required this.id, required this.breweryRepository});

  final String id;
  final BreweryRepository breweryRepository;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: FutureBuilder<dynamic>(
        future: breweryRepository.breweryDetailsRepo(id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Center(child: Text(snapshot.data.toString()));
          }else{
            return Center(child: const CircularProgressIndicator());
          }
        }
      ),
    );
  }
}
