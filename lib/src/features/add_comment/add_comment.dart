import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../provider/add_comment_controller.dart';
import '../../utils/utils.dart';

class AddComment extends StatelessWidget {
  const AddComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('addNewComment'),
      body: const SafeArea(bottom: false, child: AddCommentView()),
    );
  }
}

class AddCommentView extends StatelessWidget {
  const AddCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddCommentController>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.00, vertical: 20.00),
      child: Form(
          key: provider.addCommentFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: provider.commentTextController,
                decoration: textField('comment'),
                maxLines: 12,
                minLines: 1,
                validator: Utils.validateEmpty,
              ),
              const SizedBox(height: 10.00),
              Consumer<AddCommentController>(
                builder: (context, ref, child) {
                  return ref.btnLoader
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 33),
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: ColorConstant.primaryColor,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            ref.onCreate();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 33),
                            width: MediaQuery.sizeOf(context).width,
                            padding:
                                const EdgeInsets.symmetric(vertical: 10.00),
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius: BorderRadius.circular(06.00)),
                            alignment: Alignment.center,
                            child: Text(
                              'Create',
                              style: FontConstant.inter.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.whiteColor),
                            ),
                          ),
                        );
                },
              )
            ],
          )),
    );
  }
}
