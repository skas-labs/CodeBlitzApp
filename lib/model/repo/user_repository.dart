class UserRepository {
  UserRepository();

  // Future<void> signInWithCredentials(String email, String password) {
  //   return _firebaseAuth.signInWithEmailAndPassword(
  //       email: email, password: password);
  // }

  // Future<void> signUp(
  //     {String email, String password, String displayName}) async {
  //   await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   var currentUser = await _firebaseAuth.currentUser();
  //
  //   //update info
  //   var userInfo = UserUpdateInfo();
  //   userInfo.displayName = displayName;
  //   await currentUser.updateProfile(userInfo);
  // }
  //
  // Future<void> signOut() async {
  //   return Future.wait([
  //     _firebaseAuth.signOut(),
  //     _googleSignIn.signOut(),
  //   ]);
  // }

  Future<bool> isSignedIn() async {
    return false;
  }

  Future<String> getUser() async {
    return "Pulkit";
  }
}
