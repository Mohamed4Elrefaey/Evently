import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/Firebase/firestore_manager.dart';
import 'package:evently/core/providers/EventProvider.dart';
import 'package:evently/core/resources/DialogUtils.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/Edit_event/edit_event_screen.dart';
import 'package:evently/ui/Event_details/widget/Custom_icon.dart';
import 'package:evently/ui/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/AssetsManager.dart';

class DetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    EventProvider provider = Provider.of<EventProvider>(context);
    bool isAr = context.locale.languageCode == 'ar';
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          width: 32,
          height: 32,
          child: Transform.rotate(
            angle: isAr ? pi : 0,
            child: SvgPicture.asset(
              AssetsManager.arrowBack,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        StringsManager.eventDetails.tr(),
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(fontSize: 18),
      ),
      centerTitle: true,
      actions:
          FirebaseAuth.instance.currentUser!.uid ==
              provider.currentEvent?.userId
          ? [
              CustomIcon(
                onclick: () {
                  provider.setMyEvent();
                  Navigator.pushNamed(context, EditEventScreen.routeName);
                },
                iconImage: AssetsManager.editEventIcon,
              ),
              CustomIcon(
                onclick: () async {
                  await deleteEvent(context);
                  // handle delete event if it yours
                },
                iconImage: AssetsManager.deleteEventIcon,
                isTrash: true,
              ),
            ]
          : [],
    );
  }

  Future<void> deleteEvent(BuildContext context) async {
    // 1. Grab the provider and ID before the async gap
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    final eventId = eventProvider.currentEvent?.id;
    if (eventId == null) {
      print("Null event id");
      return ;
    };
    try {
      // 3. Await the actual deletion
      await FirestoreManager.deleteEvent(eventId: eventId);
      // 4. Update local state
      eventProvider.myEvent = null;
      // 5. Check if the widget is still "alive" before using context
      if (!context.mounted) return;
      // 6. Pop the loading dialog & navigate
      Navigator.pushReplacementNamed(context, Homescreen.routeName);
      DialogUtils.showToast("Deleted event successfully", context);
    } catch (e) {
      // 7. Handle errors gracefully
      if (context.mounted) {
        Navigator.pop(context); // Close loading
        DialogUtils.showToast("Failed to delete: ${e.toString()}", context);
      }
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
