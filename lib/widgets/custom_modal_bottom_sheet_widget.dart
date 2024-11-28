import 'package:flutter/material.dart';
import 'package:si_danus/common/constant.dart';

showModal(
  BuildContext context,
  Widget content, {
  int? index,
  bool isScrollControlled = false,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: white2,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(defaultBorderRadius),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: defaultPadding),
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[800]!,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                  ),
                ),
                content,
              ],
            ),
          ),
        ],
      );
    },
  );
}
