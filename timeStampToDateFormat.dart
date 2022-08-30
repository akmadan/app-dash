DateFormat.yMMMMd().format(
    Timestamp.fromMillisecondsSinceEpoch(
    docs[index]['created_at']
    .millisecondsSinceEpoch)
    .toDate())
                                      
                                      
                                      
   Pattern                           Result
 ----------------                  -------
 DateFormat.yMd()                 -> 7/10/1996
 DateFormat('yMd')                -> 7/10/1996
 DateFormat.yMMMMd('en_US')       -> July 10, 1996
 DateFormat.jm()                  -> 5:08 PM
 DateFormat.yMd().add_jm()        -> 7/10/1996 5:08 PM
 DateFormat.Hm()                  -> 17:08 // force 24 hour time
