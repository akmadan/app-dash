// Install dropdown_button2: dependency


 final List<String> items = [
    'Not preparing',
    'Preparing',
    'Ready to go',
    'Out for delivery',
    'Delivered',
    'Cancelled'
  ];
  
  
  String? selectedValue;

  Container(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            width: double.infinity,
                            height: 70,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                buttonPadding: EdgeInsets.all(8),
                                buttonDecoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFE7EAEB),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                hint: Text(
                                  'Select Item',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: ['NSSF Hi-Innovator', 'Other']
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: partnerProgram,
                                onChanged: (value) {
                                  setState(() {
                                    partnerProgram = value as String;
                                  });
                                },
                                buttonHeight: 40,
                                buttonWidth: 140,
                                itemHeight: 40,
                              ),
                            )),
