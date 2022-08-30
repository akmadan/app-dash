 StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('')
                                    .doc()
                                    .collection('')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.black),
                                    );
                                  } else {
                                    final docs = snapshot.data!.docs;
                                    return ListView.builder(
                                      itemCount: docs.length,
                                      itemBuilder: (context, index) {
                                        return AssignmentCardStudent(
                                            id: docs[index].id,
                                            videoLink: docs[index]
                                                ['playback_url'],
                                            title: docs[index]
                                                ['assignment_title'],
                                            deadline: Timestamp
                                                    .fromMillisecondsSinceEpoch(docs[
                                                                index]
                                                            ['assignment_date']
                                                        .millisecondsSinceEpoch)
                                                .toDate());
                                      },
                                    );
                                  }
                                },
                              ),
