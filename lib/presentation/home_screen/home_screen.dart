import 'package:flutter/material.dart';
import 'package:resume/core/constant/extension.dart';
import 'package:resume/domain/workspace_model.dart';
import 'package:resume/presentation/home_screen/details_card.dart';
import '../../core/constant/strings.dart';
import '../common_widgets/common_text/common_richtext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: Strings.homeScreenTitle,),
      appBar: AppBar(
        toolbarHeight: context.height(context) * 0.12,
        title:const CommonRichText(title: Strings.homeScreenTitle,)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Container(),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 10.0, // Horizontal spacing
                  mainAxisSpacing: 10.0, // Vertical spacing
                ),
                itemCount: workSpaceModelList.length,
                itemBuilder: (context, index) {
                  return DetailsCard(workmodel: workSpaceModelList[index], index: index,);
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

