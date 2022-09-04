scaffoldMessage(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}


// scaffold message with progress loader using provider
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                key: ValueKey('snack'),
                                duration: Duration(days: 365),
                                content: Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: Consumer<LoadingModel>(
                                      builder: ((context, model, child) => Row(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child:
                                                      CircularPercentIndicator(
                                                    radius: 20.0,
                                                    lineWidth: 4.0,
                                                    animation: false,
                                                    animationDuration: 0,
                                                    percent:
                                                        model.percent / 100,
                                                    center: (model.percent /
                                                                100 ==
                                                            1.0)
                                                        ? Icon(
                                                            Icons.check,
                                                            color: Colors.white,
                                                          )
                                                        : Container(),
                                                    backgroundColor:
                                                        Colors.grey.shade300,
                                                    circularStrokeCap:
                                                        CircularStrokeCap.round,
                                                    progressColor:
                                                        AppColors.primary,
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text((model.percent / 100 == 1.0)
                                                  ? 'Assignment Uploaded'
                                                  : 'Uploading Your assignment'),
                                              Expanded(child: Container()),
                                              ElevatedButton(
                                                  style: AppStyles.buttonStyle,
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                  },
                                                  child: Text(
                                                    'Dismiss',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          )),
                                    ))));
