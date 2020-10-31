import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final postMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สร้างโพสหม่'),
      ),
      body: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  autofocus: true,
                  maxLines: 3,
                  controller: postMessageController,
                  validator: (String text) {
                    if (text.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                    if (text.length < 5) {
                      return 'ต้องมีความยาว 5 อักษรขึ้นไป';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'คุณกำลังทำอะไรอยู่'),
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('โพส'),
                    onPressed: () {
                      //ถ้า validate ผ่าน จะคืนค่า true
                      if (formkey.currentState.validate()) {
                        var massage = postMessageController.text;
                        print('massage...' + massage);
                        var postProvider =
                            Provider.of<PostProvider>(context, listen: false);
                        postProvider.addNewPost(massage);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
