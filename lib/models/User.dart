class User {
  // must be nullable
  // any object i will receive it from external resource his data must be nullable
  String? name;
  String? id;
  String? email;
  List<String>? favorites;

  User({this.name, this.email, this.id , this.favorites =const []});

  // Use named constructor to convert Map to object
  // initialize object from firestore
  // may be the user not found so make Map nullable
  // I will use them into withConverter
  User.fromFireStore(Map<String, dynamic>? data) {
    // read
    id = data?["id"];
    name = data?["name"];
    email = data?["email"];
    favorites = (data?["favorite"] as List).cast<String>();
  }

  // Create function to convert object to map to send it to firestore
  Map<String, dynamic> toFireStore() {
    // write
    return {
      "id": id,
      "name": name,
      "email": email,
      "favorite": favorites
    };
  }
}
