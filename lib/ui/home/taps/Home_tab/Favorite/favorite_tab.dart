import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/AllTab.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {

  late TextEditingController controller ;
  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomField(
              suffixIcon: AssetsManager.search,
              hint: StringsManager.searchHint.tr(),
              Controller: controller,
              validation: null,
            ),
            SizedBox(height: 16,),
            Expanded(child: AllTab()),
          ],
        ),
      ),
    );
  }
}
