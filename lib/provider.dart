// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:filminfo/film_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FilmProvider extends ChangeNotifier {
  List<Film> films = [];

  List<Film> get searchFilms => films;

  void getFilms(String item) async {
    final response = await http.get(Uri.parse("http://www.omdbapi.com/?s=$item&apikey=fcf1b9d6"));

    
    final filmList = jsonDecode(response.body)["Search"];


    List<Film> tempFilms = [];

    for (var filmMap in filmList)
     {
      Film film = Film.fromMap(filmMap);
      tempFilms.add(film);
    }
    films = tempFilms;


    notifyListeners(); 
  }
}



