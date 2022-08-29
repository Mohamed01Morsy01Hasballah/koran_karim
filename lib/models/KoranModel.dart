class KoranModel{
  String? Name;
  int? Number;
  String? Surah;
  KoranModel({
    this.Name,
    this.Number,
    this.Surah
});
  KoranModel.fromJson(Map<String,dynamic>json){
    Name=json['Name'];
    Number=json['Number'];
    Surah=json['Surah'];
  }
}