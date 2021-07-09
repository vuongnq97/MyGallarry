import "package:http/http.dart" as http;
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'profile',
  'https://www.googleapis.com/auth/photoslibrary',
]);

class LoginController extends GetxController {
  Rx<GoogleSignInAccount>? currentUser;

  static LoginController to = Get.find();

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        currentUser = account.obs;
      }
      if (currentUser != null) {
        _handleGetContact(currentUser!.value);
      }
    });
    _googleSignIn.signInSilently();
    update();
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
    currentUser = null;
    update();
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      getCurrentUser();
      update();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
  }
}
