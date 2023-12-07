import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/default_button.dart';
import 'package:e_commerce_app_api_cubit/shared/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constant/colors.dart';
import '../../profile/widgets/profile_pic.dart';

class MyAccountBody extends StatelessWidget {
  MyAccountBody({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LayoutCubit>(
      create: (context) => LayoutCubit()..getUserData(),
      child: BlocBuilder<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
          if (cubit.userModel != null) {
            nameController.text = cubit.userModel!.name!;
            emailController.text = cubit.userModel!.email!;
            phoneController.text = cubit.userModel!.phone!;
          }

          return cubit.userModel != null
              ? Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePic(
                        image: cubit.userModel!.image!,
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                      Visibility(
                        child: Column(
                          children: [
                            MyAccountItem(
                              controller: nameController,
                              title: 'Name :',
                              content: cubit.userModel!.name!,
                            ),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            MyAccountItem(
                              controller: emailController,
                              title: 'Email :',
                              content: cubit.userModel!.email!,
                            ),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            MyAccountItem(
                              controller: phoneController,
                              title: 'Phone :',
                              content: cubit.userModel!.phone!,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      BlocConsumer<LayoutCubit, LayoutStates>(
                        listener: (context, state) {
                          if (state is UpdateProfileSuccessState) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  content: const Text(
                                    'Data updated successfuly',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: kPrimaryColor,
                                );
                              },
                            );
                          } else if (state is UpdateProfileFaliureState) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  content: Text(
                                    state.error,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: kPrimaryColor,
                                );
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          return DefaultButton(
                            text: state is UpdateProfileLoadingState
                                ? 'Loading'
                                : "Update",
                            onPressed: () {
                              cubit.updateProfiel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text);
                            },
                          );
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(40)),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class MyAccountItem extends StatelessWidget {
  const MyAccountItem({
    super.key,
    required this.content,
    required this.title,
    required this.controller,
  });

  final String content;
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF5F6F9),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(
            title,
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: EditableText(
              controller: controller,
              focusNode: FocusNode(),
              style: const TextStyle(color: kPrimaryColor, fontSize: 20),
              cursorColor: kPrimaryColor,
              backgroundCursorColor: const Color(0xFFF5F6F9),
            ),
          ),
          // Expanded(
          //   child: Text(
          //     content,
          //     style: const TextStyle(color: kPrimaryColor, fontSize: 20),
          //   ),
          // ),
        ],
      ),
    );
  }
}
