class TaskModel {
  Data? _data;
  String? _message;
  List<dynamic>? _error = [];
  int? _status;

  TaskModel({Data? data, String? message, List<dynamic>? error, int? status}) {
    if (data != null) {
      _data = data;
    }
    if (message != null) {
      _message = message;
    }
    if (error != null) {
      _error = error;
    }
    if (status != null) {
      _status = status;
    }
  }

  Data? get data => _data;

  String? get message => _message;

  List<dynamic>? get error => _error;

  int? get status => _status;

  TaskModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _error = json['error'].cast<dynamic>();
    _status = json['status'];
  }
}

class Data {
  List<Tasks>? _tasks = [];
  Meta? _meta;
  Links? _links;
  List<String>? _pages;

  Data({List<Tasks>? tasks, Meta? meta, Links? links, List<String>? pages}) {
    if (tasks != null) {
      _tasks = tasks;
    }
    if (meta != null) {
      _meta = meta;
    }
    if (links != null) {
      _links = links;
    }
    if (pages != null) {
      _pages = pages;
    }
  }

  List<Tasks>? get tasks => _tasks;
  Meta? get meta => _meta;
  Links? get links => _links;
  List<String>? get pages => _pages;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      json['tasks'].forEach((v) {
        _tasks!.add(Tasks.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _pages = json['pages'].cast<String>();
  }
}

class Tasks {
  int? _id;
  String? _title;
  String? _description;
  String? _image;
  String? _startDate;
  String? _endDate;
  String? _status;

  Tasks({
    int? id,
    String? title,
    String? description,
    String? image,
    String? startDate,
    String? endDate,
    String? status,
  }) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (image != null) {
      _image = image;
    }
    if (startDate != null) {
      _startDate = startDate;
    }
    if (endDate != null) {
      _endDate = endDate;
    }
    if (status != null) {
      _status = status;
    }
  }

  int? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get image => _image;

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get status => _status;

  Tasks.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _status = json['status'];
  }
}

class Meta {
  int? _total;
  int? _perPage;
  int? _currentPage;
  int? _lastPage;

  Meta({int? total, int? perPage, int? currentPage, int? lastPage}) {
    if (total != null) {
      _total = total;
    }
    if (perPage != null) {
      _perPage = perPage;
    }
    if (currentPage != null) {
      _currentPage = currentPage;
    }
    if (lastPage != null) {
      _lastPage = lastPage;
    }
  }

  int? get total => _total;
  int? get perPage => _perPage;
  int? get currentPage => _currentPage;
  int? get lastPage => _lastPage;

  Meta.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _lastPage = json['last_page'];
  }
}

class Links {
  String? _first;
  String? _last;
  String? _prev;
  String? _next;

  Links({String? first, String? last, String? prev, String? next}) {
    if (first != null) {
      _first = first;
    }
    if (last != null) {
      _last = last;
    }
    if (prev != null) {
      _prev = prev;
    }
    if (next != null) {
      _next = next;
    }
  }

  String? get first => _first;
  String? get last => _last;
  String? get prev => _prev;
  String? get next => _next;

  Links.fromJson(Map<String, dynamic> json) {
    _first = json['first'];
    _last = json['last'];
    _prev = json['prev'];
    _next = json['next'];
  }
}
