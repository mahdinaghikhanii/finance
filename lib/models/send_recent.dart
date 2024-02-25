class SendRecent {
  String? profileName;
  String? profileUrl;

  SendRecent({this.profileName, this.profileUrl});

  SendRecent.fromJson(Map<String, dynamic> json) {
    profileName = json['profileName'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileName'] = profileName;
    data['profileUrl'] = profileUrl;
    return data;
  }
}
