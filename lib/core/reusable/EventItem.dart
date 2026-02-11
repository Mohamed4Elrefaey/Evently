import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/Firebase/firestore_manager.dart';
import 'package:evently/core/providers/EventProvider.dart';
import 'package:evently/core/providers/User_provider.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AppCostance.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/models/Event_model.dart';
import 'package:evently/ui/Event_details/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {
  Event event;

  EventItem({super.key, required this.event});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.23,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                eventProvider.setEvent(event: widget.event);
                Navigator.pushNamed(context, EventDetailsScreen.routeName);
              },
              child: Image.asset(
                provider.mode == ThemeMode.dark
                    ? Appcostance.typesOfEventsDark[widget.event.type] ??
                          AssetsManager.birthdayImageDark
                    : Appcostance.typesOfEventsLight[widget.event.type] ??
                          AssetsManager.birthdayImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.surfaceBright,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    child: Text(
                      DateFormat.MMMd().format(
                        widget.event.dateOfTime?.toDate() ?? DateTime.now(),
                      ),
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.surfaceBright,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.event.title ?? "No title",
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (userProvider.UserData?.favorites?.contains(
                                  widget.event.id,
                                ) ??
                                false) {
                              // remove event from firestore
                              FirestoreManager.removeFavoriteEvent(
                                event: widget.event,
                              );
                              // remove event from Ram
                              userProvider.UserData?.favorites?.remove(
                                widget.event.id,
                              );
                              // update favorite list from firestore
                              FirestoreManager.updateUserFavorite(
                                userProvider.UserData?.favorites ?? [],
                              );
                            } else {
                              FirestoreManager.addFavoriteEvent(
                                event: widget.event,
                              );
                              userProvider.UserData?.favorites?.add(
                                widget.event.id ?? "",
                              );
                              FirestoreManager.updateUserFavorite(
                                userProvider.UserData?.favorites ?? [],
                              );
                            }
                            setState(() {});
                          },
                          icon: SvgPicture.asset(
                            userProvider.UserData?.favorites?.contains(
                                      widget.event.id,
                                    ) ??
                                    false
                                ? AssetsManager.selectedHeart
                                : AssetsManager.heart,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
