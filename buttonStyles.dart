// Apple Sign in button
 Container(
              height: 55,
              margin: Spacings.pagePadding,
              width: double.infinity,
              child: ElevatedButton.icon(
                  icon: Icon(Icons.apple),
                  style: AppStyles.appleSigninButton,
                  onPressed: () async {
                    await AuthServices.signInWithGoogle(context, 'teacher');
                  },
                  label: Text('Sign in with Apple')),
 ),

  static ButtonStyle appleSigninButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))));


// Google Sign in Button
// font_awesome_flutter: 
Container(
              height: 55,
              margin: Spacings.pagePadding,
              width: double.infinity,
              child: ElevatedButton.icon(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.black,
                  ),
                  style: AppStyles.googleSigninButton,
                  onPressed: () async {
                    await AuthServices.signInWithGoogle(context, 'student');
                  },
                  label: Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.black),
                  )),
            ),

  static ButtonStyle appleSigninButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))));


// Other Styles
 static ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))));
  static ButtonStyle whitebuttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))));
  static ButtonStyle redbuttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.red),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))));

  static ButtonStyle buttonStyle2 = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: AppColors.primary))));
