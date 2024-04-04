import 'package:flutter/material.dart';

class TaskModel {
  Data? data;
  String? message;
  List<dynamic>? error = [];
  int? status;

  TaskModel({this.data, this.message, this.error, this.status});

  TaskModel.fromJson(Map<String, dynamic> json, {required Color color}) {
    data =
        json['data'] != null ? Data.fromJson(json['data'], color: color) : null;
    message = json['message'];
    error = json['error'].cast<dynamic>();
    status = json['status'];
  }
}

class Data {
  List<Tasks>? tasks = [];
  Meta? meta;
  Links? links;
  List<String>? pages;

  Data({this.tasks, this.meta, this.links, this.pages});

  Data.fromJson(Map<String, dynamic> json, {required Color color}) {
    if (json['tasks'] != null) {
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v, color: color));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    pages = json['pages'].cast<String>();
  }
}

class Tasks {
  int? id;
  String? title;
  String? description;
  String? image;
  String? startDate;
  String? endDate;
  String? status;
  Color? sendColor;

  Tasks(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.startDate,
      this.endDate,
      this.status});

  Tasks.fromJson(Map<String, dynamic> json, {required Color color}) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    sendColor = color;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
}
