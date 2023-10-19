import 'package:flutter/material.dart';
import 'package:untitled1/screens/topic%20selection/controller/topic_selection_controller.dart';
import 'package:get/get.dart';
import 'package:untitled1/screens/topic%20selection/views/topic_name_widget.dart';

class TopicSelectionPage extends StatefulWidget {
  TopicSelectionPage({super.key});


  @override
  State<TopicSelectionPage> createState() => _TopicSelectionPageState();
}

class _TopicSelectionPageState extends State<TopicSelectionPage> {
  TopicSelectionController controller = Get.put(TopicSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Pick 3 or more topic",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30,color: Colors.blue),),
              const SizedBox(height: 30,),
              Wrap(
                  spacing: 8.0, // spacing between adjacent chips
                  runSpacing: 8.0, // spacing between lines of chips
                children : controller.topicList.map((item) => TopicNameWidget(item)).toList()

              ),

              const SizedBox(height: 30,),
              Obx(()=>GestureDetector(
                  onTap: () {
                    if(controller.pickedTopics.length<3)
                      {
                        Get.snackbar("Add more", "Please add more topics to continue");
                      }
                    else{
                      Get.snackbar("Successful", "Move to next page");

                    }

                  },
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.pickedTopics.length>=3?Colors.blueAccent:Colors.grey),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
