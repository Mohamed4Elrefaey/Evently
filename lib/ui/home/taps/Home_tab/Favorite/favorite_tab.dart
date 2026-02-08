import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Firebase/firestore_manager.dart';
import '../../../../../core/reusable/EventItem.dart';
import '../../../../../models/Event_model.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late TextEditingController controller;

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
              controller: controller,
              validation: null,
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder(
                stream: FirestoreManager.getFavoriteEventList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // loading
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    // error
                    return Column(
                      children: [
                        Text(snapshot.error.toString()),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Try again"),
                        ),
                      ],
                    );
                  }
                  // success
                  List<Event> all_Events = snapshot.data ?? [];
                  return ListView.separated(
                    itemBuilder: (context, index) =>
                        EventItem(event: all_Events[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: all_Events.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
