import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIcon extends StatelessWidget {
  final Color color;
  final GestureTapCallback? onTap;

  SignIcon({
    Key? key,
    this.color = Colors.grey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class OnOffIcon extends StatefulWidget {
  void Function(bool isOn)? onTap;
  final bool? state;

  OnOffIcon({
    this.onTap,
    this.state = false,
  });

  @override
  _OnOffIcon createState() => _OnOffIcon();
}

class OnOffControl extends GetxController {
  RxBool isOn = RxBool(false);
}
class _OnOffIcon extends State<OnOffIcon> {
  final OnOffControl offControl = OnOffControl();

  @override
  void initState() {
    offControl.isOn.value = widget.state!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    offControl.isOn.value = widget.state!;
    return GetBuilder(
      init: offControl,
      global: false,
      builder: (_) {
        return Obx(() {
          return InkWell(
            onTap: () {
              offControl.isOn.value = !offControl.isOn.value;
              if (widget.onTap != null) {
                widget.onTap!.call(offControl.isOn.value);
              }
            },
            child: Container(
              width: 60,
              height: 30,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(width: 1)
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    child: SignIcon(
                      color: offControl.isOn.value ? Colors.green : Colors.grey,
                    ),
                    duration: const Duration(milliseconds: 100),
                    left: offControl.isOn.value ? null : 0,
                    right: offControl.isOn.value ? 0 : null,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
