import 'package:easy_localization/easy_localization.dart';
import 'package:evently/ui/home/taps/Home_tab/Favorite/no_favorite.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/AssetsManager.dart';
import '../../../../../core/resources/StringsManager.dart';
import '../../../../../core/reusable/Custom_field.dart';
import '../../../../../core/reusable/EventItem.dart';
import '../../../../../models/Event_model.dart';

class FavoriteBody extends StatefulWidget {
  List<Event>? allEvents;

  FavoriteBody({required this.allEvents});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  late TextEditingController controller;
  String searchEvent = "";

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
    List<Event> filteredList = searchForEvent(widget.allEvents ?? []);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomField(
            onChange: (value) {
              setState(() {
                searchEvent = value;
              });
            },
            suffixIcon: AssetsManager.search,
            hint: StringsManager.searchHint.tr(),
            controller: controller,
            validation: null,
          ),
          SizedBox(height: 16),
          Expanded(
            child: widget.allEvents!.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) =>
                        EventItem(event: filteredList[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: filteredList.length,
                  )
                : NoFavorite(),
          ),
        ],
      ),
    );
  }

  List<Event> searchForEvent(List<Event> allEvents) {
    List<Event> filteredList = [];
    if (searchEvent.isEmpty) {
      filteredList = allEvents;
      return filteredList;
    }
    if (searchEvent.isNotEmpty) {
      for (final event in allEvents) {
        if (event.title!.toLowerCase().contains(searchEvent.toLowerCase())) {
          filteredList.add(event);
        }
      }
    }
    return filteredList;
  }
}
