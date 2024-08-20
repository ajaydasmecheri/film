// ignore_for_file: avoid_print

import 'package:filminfo/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => FilmProvider(),
    ),
  ], child: const FilmRater()));
}

class FilmRater extends StatefulWidget {
  const FilmRater({super.key});

  @override
  State<FilmRater> createState() => _FilmRaterState();
}

class _FilmRaterState extends State<FilmRater> {
  var searchData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<FilmProvider>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 8,
          centerTitle: true,
          title: const Text(
            "Film Rater",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: SizedBox(
                height: screenHeight * 0.09,
                child: SearchBar(
                  controller: searchData,
                  hintText: "search a movie",
                  leading: const Icon(Icons.search),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  provider.getFilms(searchData.text.trim());
                },
                child: const Text("search")),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            Expanded(
              child: Consumer<FilmProvider>(builder: (context, data, _) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: screenHeight * 0.6,
                        child: ListView(
                            children: data.searchFilms.isNotEmpty
                                ? List.generate(data.searchFilms.length,
                                    (index) {
                                    return Column(
                                      children: [
                                        Image(
                                            image: NetworkImage(data
                                                .searchFilms[index].Poster)),
                                        Text(data.searchFilms[index].Title),
                                        Text(data.searchFilms[index].Type),
                                        Text(data.searchFilms[index].Year),
                                        Text(data.searchFilms[index].imdbID)
                                      ],
                                    );
                                  })
                                : [
                                    const Text(
                                      "No data",
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}


