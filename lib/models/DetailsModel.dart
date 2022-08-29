class DetailsModel {
  String? content;
  String? reference;
  String? description;
  String? count;
  int? section_id;
  DetailsModel({
    this.count,
    this.reference,
    this.description,
    this.content,
    this.section_id
});
  DetailsModel.fromJson(Map<String,dynamic>json){
    content=json['content'];
    reference=json['reference'];
    description=json['description'];
    count=json['count'];
    section_id=json['section_id'];
  }


}