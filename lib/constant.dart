//loadSections() async {
//     DefaultAssetBundle.of(context)
//         .loadString("assets/database/sections_db.json")
//         .then((data) {
//       var response = json.decode(data);
//       response.forEach((section) {
//         SectionModel _section = SectionModel.fromJson(section);
//         sections.add(_section);
//       });
//       setState(() {});
//     }).catchError((error) {
//       print(error);
//     });
//   }