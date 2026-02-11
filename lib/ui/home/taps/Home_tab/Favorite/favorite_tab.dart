import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:evently/ui/home/taps/Home_tab/Favorite/favoirte_body.dart';
import 'package:evently/ui/home/taps/Home_tab/Favorite/no_favorite.dart';
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


  Stream<List<Event>> favEventList =  FirestoreManager.getFavoriteEventList();

  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: StreamBuilder(
          stream: favEventList,
          builder: (context, snapshot) {
            // loading
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            List<Event>? allEvents = snapshot.data ;
            if(snapshot.hasError){
              return Center(child: Text("something went wrong"),);
            }
            if(snapshot.data!.isEmpty || !snapshot.hasData){
              return FavoriteBody(allEvents:allEvents ?? [] );
            }
            return FavoriteBody(allEvents: allEvents!,);
          },
      )
    );
  }
}
