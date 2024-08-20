class Film {
  final String Title;
  final String Year;
  final String imdbID;
  final String Type;
  final String Poster;

  Film(
      {required this.Poster,
      required this.Title,
      required this.Type,
      required this.Year,
      required this.imdbID});
  factory Film.fromMap(Map<String, dynamic> filmMap) {
    return Film(
        Poster: filmMap["Poster"],
        Title: filmMap["Title"],
        Type: filmMap["Type"],
        Year: filmMap["Year"],
        imdbID: filmMap["imdbID"]);



        
  }
}
