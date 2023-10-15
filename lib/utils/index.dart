import 'package:flutter/material.dart';

class CustomUtils {
  void loadingModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(24),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Espere..."),
              ],
            ),
          ),
        );
      },
    );
  }

  void showCustomDialog(
      BuildContext context,
      String title,
      String description,
      String cancelTitle,
      Function cancelCalback,
      String aprooveTitle,
      Function aprroveCallback) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shadowColor: Colors.black.withAlpha(100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ), //this right here
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Center(
                        //   child: SvgPicture.asset('assets/icons/check.svg'),
                        // ),
                        // const SizedBox(height: 24),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    endIndent: 0,
                    height: 0.5,
                    thickness: 0.5,
                    indent: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              cancelCalback();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 20,
                              ),
                              child: Text(
                                cancelTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 0.5,
                          indent: 0,
                          endIndent: 0,
                          width: 0.5,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              aprroveCallback();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 20,
                              ),
                              child: Text(
                                aprooveTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

List<String> listDynamicToListString(List<dynamic> list) {
  return list.map((e) => e as String).toList();
}
