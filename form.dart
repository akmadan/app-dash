final _formKey = GlobalKey<FormState>();


 validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Contact';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            contact = value!;
                          });
                        },

 if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              await FirestoreServices.updateUser(
                  fullname, organisation, contact);
              scaffoldMessage(context, 'Profile Updated');
            }
  },

