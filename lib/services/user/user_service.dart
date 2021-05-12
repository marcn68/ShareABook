abstract class UserService {
  Future updateUser({String userImage, String fullName});
  Future deleteUser({String password});
  Future changePassword({String newPassword, String oldPassword});
}
