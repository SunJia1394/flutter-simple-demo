import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeriodicRequester extends StatelessWidget {
  Stream<http.Response> getRandomNumberFact() {
    http.get(Uri.parse("http://124.222.89.110:5002/listenThoughts"))
        .then((response) {
          print("================");
      print(response);
    }).catchError((error) {
      print(error);
    });
    return http.get(Uri.parse("http://124.222.89.110:5002/listenThoughts") ).asStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<http.Response>(
      stream: getRandomNumberFact(),
      builder: (context, snapshot) => snapshot.hasData
          ? Center(child: Text(snapshot.data!.body))
          : CircularProgressIndicator(),
    );
  }
}