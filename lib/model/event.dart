class Event{
  static const String collectionName = "Event";
  String id;
  String title;
  String  description;
  String image;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;
  Event(
      {this.id = "",
      required this.title,
      required this.description,
      required this.image,
      required this.dateTime,
      required this.eventName,
      required this.time,
      this.isFavorite = false});
  Event.fromFireStore(Map<String, dynamic>? data)
      : this(
            id: data!["id"],
            title: data["title"],
            image: data["image"],
            eventName: data["eventName"],
            description: data["description"],
            dateTime: DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
            time: data["time"],
            isFavorite: data["isFavorite"]);
  Map<String, dynamic> toFireStore() {
    return {
      "id": id ,
      "title": title ,
      "description": description ,
      "image": image ,
      "eventName": eventName,
      "dateTime": dateTime.millisecondsSinceEpoch ,
      "time": time as String,
      "isFavorite": isFavorite 
    };
  }
}
