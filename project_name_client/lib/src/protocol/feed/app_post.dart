/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../feed/post_comment.dart' as _i2;

abstract class AppPost implements _i1.SerializableModel {
  AppPost._({
    this.id,
    required this.content,
    this.userProfileId,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });

  factory AppPost({
    int? id,
    required String content,
    int? userProfileId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.PostComment>? comments,
  }) = _AppPostImpl;

  factory AppPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppPost(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      userProfileId: jsonSerialization['userProfileId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      comments: (jsonSerialization['comments'] as List?)
          ?.map((e) => _i2.PostComment.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  int? userProfileId;

  DateTime? createdAt;

  DateTime? updatedAt;

  List<_i2.PostComment>? comments;

  /// Returns a shallow copy of this [AppPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppPost copyWith({
    int? id,
    String? content,
    int? userProfileId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.PostComment>? comments,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      if (userProfileId != null) 'userProfileId': userProfileId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppPostImpl extends AppPost {
  _AppPostImpl({
    int? id,
    required String content,
    int? userProfileId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.PostComment>? comments,
  }) : super._(
          id: id,
          content: content,
          userProfileId: userProfileId,
          createdAt: createdAt,
          updatedAt: updatedAt,
          comments: comments,
        );

  /// Returns a shallow copy of this [AppPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppPost copyWith({
    Object? id = _Undefined,
    String? content,
    Object? userProfileId = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? comments = _Undefined,
  }) {
    return AppPost(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      userProfileId: userProfileId is int? ? userProfileId : this.userProfileId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      comments: comments is List<_i2.PostComment>?
          ? comments
          : this.comments?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
