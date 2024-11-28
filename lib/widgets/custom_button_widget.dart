import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/constant.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final bool isLoading, isEnable, isAutoSize, isDefaultTextStyle;
  final Function() onPressed;
  final Color color;
  final Widget icon;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.isLoading,
    this.isEnable = true,
    this.isAutoSize = false,
    this.isDefaultTextStyle = true,
    this.icon = const SizedBox(),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isAutoSize
        ? SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(5),
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                backgroundColor:
                    isEnable == true ? color : color.withOpacity(0.5),
              ),
              onPressed: isEnable == true ? onPressed : () {},
              child: isLoading == true
                  ? CupertinoActivityIndicator(
                      color: white,
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: icon,
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            text,
                            style: isDefaultTextStyle
                                ? primaryTextStyle
                                : secondaryTextStyle,
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: SizedBox.shrink(),
                        ),
                      ],
                    ),
            ),
          )
        : SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                backgroundColor:
                    isEnable == true ? color : color.withOpacity(0.5),
              ),
              onPressed: isEnable == true ? onPressed : () {},
              child: isLoading == true
                  ? CupertinoActivityIndicator(
                      color: white,
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: icon,
                        ),
                        const Spacer(),
                        Text(
                          text,
                          style: isDefaultTextStyle
                              ? primaryTextStyle
                              : secondaryTextStyle,
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 80,
                        ),
                      ],
                    ),
            ),
          );
  }
}
