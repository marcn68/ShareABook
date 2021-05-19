class AppUser {
  String uid;
  String fullName;
  String email;
  String provider;
  AppUser({this.uid, this.fullName, this.email, this.provider});

  AppUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullName = json['fullName'];
    email = json['email'];
    provider = json['provider'];
  }
}
