class Task {
  String title;
  String description;
  bool done;
  DateTime dateTime;

  Task({
    this.title,
    this.description,
    this.done,
    this.dateTime
  });

  Task.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.description = json['description'];
    this.done = json['done'];
    this.dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['done'] = this.done;
    data['datetime'] = this.dateTime;
    
    return data;
  }
}