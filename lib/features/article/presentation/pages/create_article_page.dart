import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_blog/common/constants/dimens.dart';
import 'package:tech_blog/common/constants/images.dart';
import 'package:tech_blog/common/constants/my_strings.dart';
import 'package:tech_blog/common/utils/custom_snackbar.dart';
import 'package:tech_blog/common/widgets/custom_button.dart';
import 'package:tech_blog/common/widgets/form_container_widget.dart';
import 'package:tech_blog/common/widgets/see_more_widget.dart';
import 'package:tech_blog/config/theme/app_colors.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_bloc.dart';
import 'package:tech_blog/features/home/presentation/bloc/home_items_status.dart';

class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({super.key});

  @override
  State<CreateArticlePage> createState() => _CreateArticlePageState();
}

class _CreateArticlePageState extends State<CreateArticlePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  var selectedCatName = "";
  var selectedCatId = "";

  File? _image;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var bodyMargin = width / 10;

    Future<void> selectImage() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["jpg", "png"],
      );

      setState(() {
        if (result != null) {
          _image = File(result.files.first.path!);
        } else {
          print("cancelled");
        }
      });
    }

    //title dialog article
    void createTitle() {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Padding(
            padding: EdgeInsets.all(Dimens.large),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormContainerWidget(
                  controller: _titleController,
                  hintText: MyStrings.titleDialogSingleManageArticle,
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text(
                    MyStrings.save,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    postArticle() {
      if (_image == null) {
        return CustomSnackBars.showSnackError(
            context, MyStrings.selectImageError);
      }
      if (_titleController.text == "") {
        return CustomSnackBars.showSnackError(
            context, MyStrings.selectTitleError);
      }
      if (_contentController.text == "") {
        return CustomSnackBars.showSnackError(
            context, MyStrings.selectContentError);
      }
      if (selectedCatName == "") {
        return CustomSnackBars.showSnackError(
            context, MyStrings.selecCategoryError);
      } else {
        print(_image);
        print(_titleController.text);
        print(_contentController.text);
        print(selectedCatName);
        print(selectedCatId);
      }
    }

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  //image
                  SizedBox(
                      height: height / 3,
                      width: double.infinity,
                      child: _image != null
                          ? Image.file(
                              _image!.absolute,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              Images.placeHolder,
                              fit: BoxFit.cover,
                            )),
                  //header
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: Dimens.xLarge,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: GradientColors.singleAppBarGradient,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: Dimens.medium + 4,
                          ),
                          GestureDetector(
                            onTap: (() => Navigator.pop(context)),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.lightIcon,
                              size: Dimens.medium + 8,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ),

                  //pick image
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: SizedBox(
                        width: width / 2,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.image,
                            color: colorScheme.secondary,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            selectImage();
                          },
                          label: Text(
                            MyStrings.selectImage,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimens.medium + 8,
              ),
              //edit title
              SeeMore(
                title: MyStrings.editTitleArticle,
                iconImage: ICONS.bluePen,
                bodyMargin: bodyMargin,
                textTheme: textTheme,
                onTap: () => createTitle(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    bodyMargin, Dimens.small, bodyMargin, Dimens.small),
                child: Text(
                  _titleController.text == ""
                      ? MyStrings.titleArticle
                      : _titleController.text,
                  maxLines: 2,
                  style: textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: Dimens.medium + 8,
              ),
              //edit content
              SeeMore(
                bodyMargin: bodyMargin,
                textTheme: textTheme,
                title: MyStrings.editMainTextArticle,
                iconImage: ICONS.bluePen,
                onTap: () {
                  _contentEditor(context, size, textTheme, colorScheme);
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    bodyMargin, Dimens.small, bodyMargin, Dimens.small),
                child: Text(
                  _contentController.text == ""
                      ? MyStrings.editOriginalTextArticle
                      : _contentController.text,
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: Dimens.medium + 9,
              ),
              //select category
              SeeMore(
                bodyMargin: bodyMargin,
                textTheme: textTheme,
                title: MyStrings.selectCategory,
                iconImage: ICONS.bluePen,
                onTap: () {
                  _selectedTag(
                    context,
                    size,
                    textTheme,
                    colorScheme,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(bodyMargin),
                child: Text(
                  selectedCatName == ""
                      ? MyStrings.noCategorySelected
                      : selectedCatName,
                  maxLines: 2,
                  style: textTheme.headlineMedium,
                ),
              ),
              //post article button
              SizedBox(
                width: width / 2,
                child: CustomButton(
                  title: MyStrings.sendText,
                  onTap: () {
                    postArticle();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //create content article
  Future<dynamic> _contentEditor(
    BuildContext context,
    Size size,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Container(
          height: size.height / 1.2,
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.large - 2),
              topRight: Radius.circular(Dimens.large - 2),
            ),
          ),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Dimens.small),
              Container(
                width: size.width / 5,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Dimens.xLarge),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _contentController.text = "";
                    });
                  },
                  child: Text(
                    MyStrings.deleteContentArticle,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
              TextFormField(
                textAlign: TextAlign.right,
                style: textTheme.bodyLarge,
                maxLines: 20,
                controller: _contentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: MyStrings.hintArticleContentEditor,
                  hintStyle: textTheme.displaySmall!.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.xLarge),
                child: CustomButton(
                  title: MyStrings.save,
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                ),
              )
            ],
          )),
        );
      }),
    );
  }

  //selected tag bottom sheet
  Future<dynamic> _selectedTag(
    BuildContext context,
    Size size,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return Container(
          height: size.height / 2,
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.large - 2),
              topRight: Radius.circular(Dimens.large - 2),
            ),
          ),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Dimens.small),
              Container(
                width: size.width / 5,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Dimens.xLarge),
                ),
              ),
              //!read tags data in feature home
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, homeState) {
                  if (homeState.homeItemsStatus is HomeItemsCompleted) {
                    HomeItemsCompleted homeItemsCompleted =
                        homeState.homeItemsStatus as HomeItemsCompleted;

                    var tags = homeItemsCompleted.tags;
                    return SizedBox(
                      height: size.height / 2,
                      child: GridView.builder(
                        itemCount: tags.length,
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          final tagItem = tags[index];
                          return Padding(
                            padding: EdgeInsets.all(Dimens.small),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCatId = tagItem.id!;
                                  selectedCatName = tagItem.title!;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: Dimens.large - 2,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24)),
                                    color: AppColors.primaryColor),
                                child: Center(
                                  child: Text(
                                    tagItem.title!,
                                    style: textTheme.displayMedium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          )),
        );
      }),
    );
  }
}
