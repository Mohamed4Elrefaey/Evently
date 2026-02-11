
import 'package:flutter/foundation.dart';

import '../../models/Event_model.dart';

class EventProvider extends ChangeNotifier {
  Event? currentEvent ;
  Event? myEvent ;
  void setEvent({required Event event} ){
    currentEvent = event;
    notifyListeners();
  }
  void setMyEvent(){
    myEvent = currentEvent;
    notifyListeners();
  }
  void UpdateEvent({required Event newEvent}){
    myEvent = newEvent;
    notifyListeners();
  }
}