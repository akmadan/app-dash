// message screen with input

class ResponsesTeacher extends StatefulWidget {
  final String classid, assignmentid, submissionid;
  const ResponsesTeacher(
      {Key? key,
      required this.classid,
      required this.assignmentid,
      required this.submissionid})
      : super(key: key);

  @override
  State<ResponsesTeacher> createState() => _ResponsesTeacherState();
}

class _ResponsesTeacherState extends State<ResponsesTeacher> {
  TextEditingController controller = new TextEditingController();
  User curruser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appbarTitle(),
      ),
      body: Container(
        padding: Spacings.pagePadding,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('classrooms')
                    .doc(widget.classid)
                    .collection('assignments')
                    .doc(widget.assignmentid)
                    .collection('submissions')
                    .doc(widget.submissionid)
                    .collection('responses')
                    .orderBy('created_at', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return loadingWidget();
                  } else {
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                      reverse: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                            message: docs[index]['message'],
                            byme: docs[index]['created_by'] == curruser.uid);
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              height: 45,
              // color: Colors.green,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100)),
                    child: TextField(
                      controller: controller,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          hintText: 'Enter a Message',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  )),
                  IconButton(
                      onPressed: () async {
                        String text = controller.text;
                        controller.clear();
                        await FirestoreServices.sendSubmissionResponse(
                            text,
                            widget.classid,
                            widget.assignmentid,
                            widget.submissionid);
                      },
                      icon: Icon(
                        Icons.send,
                        color: AppColors.primary,
                        size: 30,
                      ))
                ],
              ),
            ),
            // SizedBox(
            //   height: 10,
            // )
          ],
        ),
      ),
    );
  }
}



// chat bubble
import 'package:flutter/material.dart';
import 'package:mypractice/utils/colors.dart';
import 'package:mypractice/utils/constants.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool byme;
  const ChatBubble({Key? key, required this.message, required this.byme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      // margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      // color: Colors.green,
      child: Row(
        mainAxisAlignment:
            byme ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // byme ? Container()
          //     : giveTime(messages[index]['time']),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(byme ? 0 : 20),
                    topLeft: Radius.circular(byme ? 20 : 0),
                  ),
                  color: byme ? AppColors.accentColor : AppColors.textColor),
              constraints: BoxConstraints(maxWidth: w! * 2 / 3),
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: message.length > 2 ? 16 : 34),
              )),
          // byme
          //       ? Container()
          //       : giveTime(messages[index]['time'])
        ],
      ),
    );
  }
}



// add message function
  static sendSubmissionResponse(
      String text, classid, assignmentid, submissionid) async {
    User? curruser = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('classrooms')
        .doc(classid)
        .collection('assignments')
        .doc(assignmentid)
        .collection('submissions')
        .doc(submissionid)
        .collection('responses')
        .add({
      'message': text,
      'created_by': curruser!.uid,
      'created_at': DateTime.now()
    });
  }
