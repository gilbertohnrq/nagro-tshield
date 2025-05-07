import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProfileResponse {
  final String name;
  final String surname;
  final StatusProposal statusProposal;
  final CreditRequestButtonComponent creditRequestButtonComponent;
  final Contact contact;
  final String? preApprovedValue;

  ProfileResponse({
    required this.name,
    required this.surname,
    required this.statusProposal,
    required this.creditRequestButtonComponent,
    required this.contact,
    this.preApprovedValue,
  });

  ProfileResponse copyWith({
    String? name,
    String? surname,
    StatusProposal? statusProposal,
    CreditRequestButtonComponent? creditRequestButtonComponent,
    Contact? contact,
    String? preApprovedValue,
  }) {
    return ProfileResponse(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      statusProposal: statusProposal ?? this.statusProposal,
      creditRequestButtonComponent:
          creditRequestButtonComponent ?? this.creditRequestButtonComponent,
      contact: contact ?? this.contact,
      preApprovedValue: preApprovedValue ?? this.preApprovedValue,
    );
  }

  factory ProfileResponse.mocked({
    String? name,
    String? surname,
    StatusProposal? statusProposal,
    CreditRequestButtonComponent? creditRequestButtonComponent,
    Contact? contact,
    String? preApprovedValue,
  }) {
    return ProfileResponse(
      name: name ?? 'Teste',
      surname: surname ?? 'Sobrenome',
      statusProposal: statusProposal ?? StatusProposal.mocked(),
      creditRequestButtonComponent:
          creditRequestButtonComponent ?? CreditRequestButtonComponent.mocked(),
      contact: contact ?? Contact.mocked(),
      preApprovedValue: preApprovedValue ?? '5000',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'statusProposal': statusProposal.toMap(),
      'creditRequestButtonComponent': creditRequestButtonComponent.toMap(),
      'contact': contact.toMap(),
    };
  }

  factory ProfileResponse.fromMap(Map<String, dynamic> map) {
    return ProfileResponse(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      statusProposal: StatusProposal.fromMap(map['statusProposal']),
      creditRequestButtonComponent: CreditRequestButtonComponent.fromMap(
          map['creditRequestButtonComponent']),
      contact: Contact.fromMap(map['contact']),
      preApprovedValue: map['preApprovedValue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileResponse.fromJson(String source) =>
      ProfileResponse.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileResponse &&
        other.name == name &&
        other.surname == surname &&
        other.statusProposal == statusProposal &&
        other.creditRequestButtonComponent == creditRequestButtonComponent &&
        other.contact == contact &&
        other.preApprovedValue == preApprovedValue;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surname.hashCode ^
        statusProposal.hashCode ^
        creditRequestButtonComponent.hashCode ^
        contact.hashCode ^
        preApprovedValue.hashCode;
  }

  @override
  String toString() {
    return 'ProfileResponse(name: $name, surname: $surname, statusProposal: $statusProposal, creditRequestButtonComponent: $creditRequestButtonComponent, contact: $contact, preApprovedValue: $preApprovedValue)';
  }
}

class StatusProposal {
  final String title;
  final String status;

  StatusProposal({
    required this.title,
    required this.status,
  });

  StatusProposal copyWith({
    String? title,
    String? status,
  }) {
    return StatusProposal(
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }

  factory StatusProposal.mocked({
    String? title,
    String? status,
  }) {
    return StatusProposal(
      title: title ?? 'Proposal Title',
      status: status ?? 'Approved',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'status': status,
    };
  }

  factory StatusProposal.fromMap(Map<String, dynamic> map) {
    return StatusProposal(
      title: map['title'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusProposal.fromJson(String source) =>
      StatusProposal.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatusProposal &&
        other.title == title &&
        other.status == status;
  }

  @override
  int get hashCode {
    return title.hashCode ^ status.hashCode;
  }

  @override
  String toString() {
    return 'StatusProposal(title: $title, status: $status)';
  }
}

class CreditRequestButtonComponent {
  final String title;
  final String subTitle;
  final String image;
  final List<String> backgroundColor;
  final String actionRoute;
  final String preApprovedValue;
  final String text;

  CreditRequestButtonComponent({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.backgroundColor,
    required this.actionRoute,
    required this.preApprovedValue,
    required this.text,
  });

  CreditRequestButtonComponent copyWith({
    String? title,
    String? subTitle,
    String? image,
    List<String>? backgroundColor,
    String? actionRoute,
    String? preApprovedValue,
    String? text,
  }) {
    return CreditRequestButtonComponent(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      image: image ?? this.image,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      actionRoute: actionRoute ?? this.actionRoute,
      preApprovedValue: preApprovedValue ?? this.preApprovedValue,
      text: text ?? this.text,
    );
  }

  factory CreditRequestButtonComponent.mocked({
    String? title,
    String? subTitle,
    String? image,
    List<String>? backgroundColor,
    String? actionRoute,
    String? preApprovedValue,
    String? text,
  }) {
    return CreditRequestButtonComponent(
      title: title ?? '',
      subTitle: subTitle ?? '',
      image: image ?? 'image.svg',
      backgroundColor: backgroundColor ?? ['#FFFFFF', '#000000'],
      actionRoute: actionRoute ?? 'request-credit',
      preApprovedValue: preApprovedValue ?? '5000',
      text: text ?? 'Request Credit',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'image': image,
      'backgroundColor': backgroundColor,
      'actionRoute': actionRoute,
      'preApprovedValue': preApprovedValue,
      'text': text,
    };
  }

  factory CreditRequestButtonComponent.fromMap(Map<String, dynamic> map) {
    return CreditRequestButtonComponent(
      title: map['title'] ?? '',
      subTitle: map['subTitle'] ?? '',
      image: map['image'] ?? '',
      backgroundColor: List<String>.from(map['backgroundColor'] ?? []),
      actionRoute: map['actionRoute'] ?? '',
      preApprovedValue: map['preApprovedValue'] ?? '',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditRequestButtonComponent.fromJson(String source) =>
      CreditRequestButtonComponent.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditRequestButtonComponent &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.image == image &&
        listEquals(other.backgroundColor, backgroundColor) &&
        other.actionRoute == actionRoute &&
        other.preApprovedValue == preApprovedValue &&
        other.text == text;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subTitle.hashCode ^
        image.hashCode ^
        backgroundColor.hashCode ^
        actionRoute.hashCode ^
        preApprovedValue.hashCode ^
        text.hashCode;
  }

  @override
  String toString() {
    return 'CreditRequestButtonComponent(title: $title, subTitle: $subTitle, image: $image, backgroundColor: $backgroundColor, actionRoute: $actionRoute, preApprovedValue: $preApprovedValue, text: $text)';
  }
}

class Contact {
  final String? email;
  final String? phone;

  Contact({
    this.email,
    this.phone,
  });

  Contact copyWith({
    String? email,
    String? phone,
  }) {
    return Contact(
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  factory Contact.mocked({
    String? email,
    String? phone,
  }) {
    return Contact(
      email: 'example@nagro.com',
      phone: '+55999999999',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (email != null) {
      result['email'] = email;
    }
    if (phone != null) {
      result['phone'] = phone;
    }

    return result;
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      email: map['email'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact && other.email == email && other.phone == phone;
  }

  @override
  int get hashCode {
    return email.hashCode ^ phone.hashCode;
  }

  @override
  String toString() {
    return 'Contact(email: $email, phone: $phone)';
  }
}
