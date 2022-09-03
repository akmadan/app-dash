showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      elevation: 20,
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: BottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onClosing: () {},
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                        
                         
                      
                        ],
                      );
                    },
                  );
      }));
      },
)
