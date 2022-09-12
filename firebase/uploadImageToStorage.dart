
// Pick Image

//variable
 File dpfile = File('');
 bool dpset = false;
 
//function
 uploadImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png'],
  );

  if (result != null) {
    File pickedfile = File(result.files.first.path!);
    return pickedfile;
  } else {
    return File('');
  }
}

Future<String> getFirebaseStorageURL(File file) async {
  var snapshot =
      await FirebaseStorage.instance.ref().child('dp/').putFile(file);
  var downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}


//ui
  InkWell(
                                  onTap: () async {
                                    File uplaodedImage = await uploadImage();
                                    setState(() {
                                      dpfile = uplaodedImage;
                                    });
                                    if (dpfile != File('')) {
                                      setState(() {
                                        dpset = true;
                                      });
                                    }
                                  },
                                  child: !dpset
                                      ? CircleAvatar(
                                          backgroundColor: AppColors.primary
                                              .withOpacity(0.1),
                                          radius: 60,
                                          child: Center(
                                            child: Icon(
                                              Icons.upload_sharp,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 60,
                                          backgroundImage: FileImage(dpfile),
                                        ),
                                ),
