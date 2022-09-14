 TextFormField(
                                      key: ValueKey('employees'),
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        // for below version 2 use this
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      obscureText: false,
                                      decoration:
                                          AppStyles.TextFieldInputDecoration(
                                              'eg. 32'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter no. of Employees';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          estimatedEmployees =
                                              int.parse(value!);
                                        });
                                      },
                                    ),
