class Album {
  final String result;

  Album({this.result});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      result: json['result'],
    );
  }
}
