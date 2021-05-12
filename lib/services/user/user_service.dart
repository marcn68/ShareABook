abstract class UserService {
  Future updateUser({String userImage, String fullName});
  Future deleteUser();
  Future changePassword({String newPassword});
}
