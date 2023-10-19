import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/topic_selection_controller.dart';

class TopicNameWidget extends StatefulWidget {
  String name;
  TopicSelectionController controller = Get.find();

  TopicNameWidget(this.name, {super.key});

  @override
  State<TopicNameWidget> createState() => _TopicNameWidgetState();
}

class _TopicNameWidgetState extends State<TopicNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          GestureDetector(
            onTap: () {
              if (widget.controller.pickedTopics.contains(widget.name)) {
                widget.controller.pickedTopics.remove(widget.name);
              }
              else {
                widget.controller.pickedTopics.add(widget.name);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                  widget.controller.pickedTopics.contains(widget.name) ? Colors
                      .blue : Colors.grey[300]),
              padding: EdgeInsets.all(8),
              child: Text(widget.name, style: TextStyle(
                  color: widget.controller.pickedTopics.contains(widget.name)
                      ? Colors.white
                      : Colors.black)),),

    )


    );
  }
}
