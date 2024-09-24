import 'dart:io';

import 'package:flutter/material.dart';
import 'package:government_project/core/loaders/loading_overlay.dart';
import 'package:government_project/core/utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/configuration/styles.dart';
import '../widgets/custom_drawer.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final reportController = TextEditingController();
  File? selectedImage;

  pickImage() async {
    final res = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (res != null) {
      setState(() {
        selectedImage = File(res!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("الشكاوي"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "نظام معالجة الشكاوي",
                style: TextStyle(
                    color: Styles.colorPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "حرصاً منا على تأمين أفضل الخدمات ومعالجة كافة المشاكل المتعلقة بحياة وراحة المواطنين، نقدم لكم نظام معالجة الشكاوي لتسهيل وتسريع عملية معالجة الشكاوي."
                "\nيرجى ملئ الطلب التالي بجميع المعلومات:\n"
                " 1- اسم ورقم مقدم الشكوى: للتواصل معكم في حال وجود استفسارات عن المشكلة أو المخالفة المقدمة."
                "\n2- صور مرفقة: لتأكيد حدوث المخالفة أو توضيح المشكلة المراد معالجتها."
                "\n3- مضمون الشكوى: شرح طبيعة المخالفة أو المشكلة المراد معالجتها.\n"
                "جميع الخانات التي تتضمن * هي خانات ضرورية يجب تعبئتها لتستطيع إراسال الشكوى.\n"
                "تنويه: في حال وجود نقص في أحد البنود السابقة، قد يتعرض الطلب للإتلاف. يرجى تقديم كافة المعلومات المطلوبة.",
                style: TextStyle(fontSize: 16),
              ),
              CommonSizes.vBigSpace,
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0XFFF8F0E5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6.0,
                          offset: Offset(2.0, 3.0))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "اسم مقدم الشكوى:",
                      style: TextStyle(fontSize: 18),
                    ),
                    CommonSizes.vSmallerSpace,
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "الاسم والكنية",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CommonSizes.vBigSpace,
                    Text(
                      "رقم التواصل:",
                      style: TextStyle(fontSize: 18),
                    ),
                    CommonSizes.vSmallerSpace,
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "هاتف ثابت أو موبايل",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CommonSizes.vBigSpace,
                    Text(
                      "مضمون الشكوى:",
                      style: TextStyle(fontSize: 18),
                    ),
                    CommonSizes.vSmallerSpace,
                    TextField(
                      controller: reportController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "شرح طبيعة الشكوى أو المخالفة....",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CommonSizes.vBigSpace,
                    Text(
                      "الصور المرفقة:",
                      style: TextStyle(fontSize: 18),
                    ),
                    CommonSizes.vSmallerSpace,
                    selectedImage != null
                        ? Image.file(
                            selectedImage!,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          )
                        : GestureDetector(
                            onTap: () => pickImage(),
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                      size: 60,
                                    ),
                                    CommonSizes.vSmallSpace,
                                    Text(
                                      "اضغط لإضافة صورة",
                                      style: TextStyle(fontSize: 17),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    CommonSizes.vBiggerSpace,
                    GestureDetector(
                      onTap: () async {
                        if (nameController.text.trim().isNotEmpty &&
                            phoneController.text.trim().isNotEmpty &&
                            reportController.text.trim().isNotEmpty &&
                            selectedImage != null) {
                          LoadingOverlay.of(context).show();
                          await Future.delayed(Duration(seconds: 3), () {
                            LoadingOverlay.of(context).hide();
                            Utils.showSnackBar(
                                context, "تم إرسال الشكوى بنجاح");
                            nameController.clear();
                            phoneController.clear();
                            reportController.clear();
                            selectedImage = null;
                          });
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Styles.colorPrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "إرسال الشكوى",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
