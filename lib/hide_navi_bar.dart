import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideNaviBar {
  final ScrollController controller = ScrollController();
  final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  HideNaviBar() {
    visible.value = true;
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (visible.value) {
          visible.value = false;
        }
      }
      if (controller.position.userScrollDirection == ScrollDirection.forward){
        if(!visible.value){
          visible.value = true;
        }
      }
    });
  }

  void dispose(){
    controller.dispose();
    visible.dispose();
  }
}
