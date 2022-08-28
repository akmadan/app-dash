  static TextFieldInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFE7EAEB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFE7EAEB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsetsDirectional.fromSTEB(16, 18, 24, 18),
    );
  }
