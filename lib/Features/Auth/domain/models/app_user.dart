class AppUser{
  final String uid;
  final String email;

  AppUser({
    required this.uid,
    required this.email,
});

  //convert out user to a json
Map<String, dynamic> toJson(){
  return{
    'uid': uid,
    'email': email,
  };
}
//convert our json to the AppUser
factory AppUser.fromJson(Map<String, dynamic>jsonUser){
  return AppUser(uid: jsonUser['uid'], email: jsonUser['email']);

}

}