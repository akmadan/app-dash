final _fireStore = FirebaseFirestore.instance;
Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore.collection('collectionName').get();;

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //for a specific field
  final allData =
          querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();

    print(allData);
}
