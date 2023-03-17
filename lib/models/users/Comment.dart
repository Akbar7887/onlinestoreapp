class Comment {
  Comment({
      this.id, 
      this.mark, 
      this.comment,});

  Comment.fromJson(dynamic json) {
    id = json['id'];
    mark = json['mark'];
    comment = json['comment'];
  }
  int? id;
  int? mark;
  String? comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['mark'] = mark;
    map['comment'] = comment;
    return map;
  }

}