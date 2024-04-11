class UserModel {
  var name;
  var email;
  var phone;
  var rules;
  var cid;
  var uid;
  var managerPhone;
  UserModel(
      {required this.email,
      required this.phone,
      required this.cid,
      required this.uid,
      required this.name,
      required this.rules,
        required this.managerPhone,
      });
  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name ${name.runtimeType},email: $email ${email.runtimeType}, cid: $cid ${cid.runtimeType}, rules: $rules ${rules.runtimeType}, uid: $uid ${uid.runtimeType}';
  }
}
