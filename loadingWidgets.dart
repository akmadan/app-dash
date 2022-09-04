

// simple circular progress indicator
Widget loadingWidget() {
  return Center(
    child: CircularProgressIndicator(
      color: Colors.black,
    ),
  );
}


// shimmer widget
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              width: 300,
                              height: 20,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                              ),
                              width: 200,
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                    );
  }
}


// circular progress with dynamic values using provider
class LoadingWidget extends StatefulWidget {
  final int goBacks;
  const LoadingWidget({Key? key, required this.goBacks}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingModel>(
      builder: ((context, model, child) => Scaffold(
            body: Container(
              padding: Spacings.pagePadding,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 14.0,
                      animation: false,
                      animationDuration: 0,
                      onAnimationEnd: () {
                        model.percent / 100 == 1.0
                            ? Navigator.pop(context)
                            : () {};
                      },
                      percent: model.percent / 100,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (model.percent).toString() + "%",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(model.percent / 100 == 1.0
                              ? 'Uploaded'
                              : 'Uploading...')
                        ],
                      ),
                      backgroundColor: Colors.grey.shade300,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppColors.primary,
                    ),
                    Expanded(child: Container()),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: AppStyles.buttonStyle,
                          onPressed: () {
                            for (int i = 0; i < widget.goBacks; i++) {
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Continue using App')),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
