class HomeModel {
  int? id;
  String? email;
  String? firstname;
  String? lastname;
  String? avatar;

  HomeModel({this.id, this.email, this.firstname, this.lastname, this.avatar});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstname = json['first_name'] ?? 'First Name';
    lastname = json['last_name'] ?? 'Last Name';
    avatar = json['avatar'] ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThsyVVdxkz5zyuE-yRKpdwtre_R234HkS2gQ&usqp=CAU';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstname;
    data['last_name'] = this.lastname;
    data['avatar'] = this.avatar;
    return data;
  }
}
