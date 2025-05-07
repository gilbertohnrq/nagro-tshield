class ProfileBytrackerModel {
  String? name;
  String? surname;
  String? status;

  ProfileBytrackerModel({this.name, this.surname, this.status});

  ProfileBytrackerModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['n'] = name;
    data['sn'] = surname;
    return data;
  }
}
