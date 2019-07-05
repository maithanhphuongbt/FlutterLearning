import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_tutorial_chain/login/view/InputWidget.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ForceGround extends StatefulWidget {
  @override
  _ForceGroundState createState() => _ForceGroundState();
}

class _ForceGroundState extends State<ForceGround> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {

    final userNameController = TextEditingController()

    // init google sign in

    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<FirebaseUser> _handleSignIn() async {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = await _auth.signInWithCredential(credential);
      print("Authentication" + user.displayName + user.email + user.photoUrl);
      return user;
    }

    Future<void> _handleSignOut() async {
      await _auth.signOut();
      await _googleSignIn.signOut();
      print("Authentication: log out success");
    }

    //init facebook

    void onLoginStatusChanged(bool isLoggedIn) {
      setState(() {
        this.isLoggedIn = isLoggedIn;
      });
    }

    void initiateFacebookLogin() async {
      var facebookLogin = FacebookLogin();
      var facebookLoginResult =
          await facebookLogin.logInWithReadPermissions(['email']);
      switch (facebookLoginResult.status) {
        case FacebookLoginStatus.error:
          print("Error");
          onLoginStatusChanged(false);
          break;
        case FacebookLoginStatus.cancelledByUser:
          print("CancelledByUser");
          onLoginStatusChanged(false);
          break;
        case FacebookLoginStatus.loggedIn:
          print("LoggedIn");
          onLoginStatusChanged(true);
          break;
      }
    }

    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            ///holds email header and inputField
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(30.0, 0.0, userNameController),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Text(
                                'Enter your email id to continue...',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Color(0xFFA0A0A0), fontSize: 12),
                              ),
                            )),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                gradient: LinearGradient(
                                    colors: loginEmail,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: ImageIcon(
                                AssetImage("images/ic_forward.png"),
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            roundedRectButton(
                "Login with gmail", loginEmail, false, _handleSignIn),
            roundedRectButton(
                "Login out gmail", logOutEmail, false, _handleSignOut),
            roundedRectButton(
                "Login with facebook", loginFacebook, false, initiateFacebookLogin),

          ],
        )
      ],
    );
  }
}

Widget roundedRectButton(String title, List<Color> gradient,
    bool isEndIconVisible, handleSignIn()) {
  return Builder(builder: (BuildContext mContext) {
    return GestureDetector(
      onTap: () {
        handleSignIn();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment(1.0, 0.0),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(mContext).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
            Visibility(
              visible: isEndIconVisible,
              child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ImageIcon(
                    AssetImage("images/ic_forward.png"),
                    size: 30,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  });
}

const List<Color> loginEmail = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> logOutEmail = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];

const List<Color> loginFacebook = [
  Colors.lightGreen,
  Colors.blueAccent,
];
