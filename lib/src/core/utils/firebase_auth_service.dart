import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  static final FirebaseAuthService _instance = FirebaseAuthService.init();
  static FirebaseAuthService get instance => _instance;
  FirebaseAuthService.init();

  Future<void> createAccountWithEmail({required String email, required String password, required String username, required VoidCallback onSuccess, required VoidCallback onFailure}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      onSuccess();
    } catch (e) {
      onFailure();
      return;
    }
  }

  Future<void> signInWithEmail({required String email, required String password, required VoidCallback onSuccess, required VoidCallback onFailure}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      onSuccess();
    } catch (e) {
      onFailure();
    }
  }

  Future<void> signInVerificationLink({
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      ActionCodeSettings act = ActionCodeSettings(
        url: 'https://breesdemo.page.link/email-link-verification',
        handleCodeInApp: true,
        iOSBundleId: 'com.nite.brees',
        androidPackageName: 'com.nite.brees',
        androidInstallApp: true,
        androidMinimumVersion: '12',
      );

      await FirebaseAuth.instance.sendSignInLinkToEmail(email: FirebaseAuth.instance.currentUser!.email ?? '', actionCodeSettings: act);
      onSuccess();
    } catch (e) {
      onFailure();
    }
  }
}
