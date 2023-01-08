class Exercise {
  late String imageurl;
  late String description;
  late String title;

  Exercise({required String dec, required String Imageurl, required String t}) {
    description = dec;
    title = t;
    imageurl = Imageurl;
  }
}
