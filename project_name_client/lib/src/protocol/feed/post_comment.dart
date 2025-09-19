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
import '../feed/app_post.dart' as _i2;

abstract class PostComment implements _i1.SerializableModel {
  PostComment._({
    this.id,
    required this.content,
    required this.appPostId,
    this.appPost,
    this.userProfileId,
    this.createdAt,
    this.updatedAt,
  });

  factory PostComment({
    int? id,
    required String content,
    required int appPostId,
    _i2.AppPost? appPost,
    int? userProfileId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PostCommentImpl;

  factory PostComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return PostComment(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      appPostId: jsonSerialization['appPostId'] as int,
      appPost: jsonSerialization['appPost'] == null
          ? null
          : _i2.AppPost.fromJson(
              (jsonSerialization['appPost'] as Map<String, dynamic>)),
      userProfileId: jsonSerialization['userProfileId'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  int appPostId;

  _i2.AppPost? appPost;

  int? userProfileId;

  DateTime? createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PostComment copyWith({
    int? id,
    String? content,
    int? appPostId,
    _i2.AppPost? appPost,
    int? userProfileId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'appPostId': appPostId,
      if (appPost != null) 'appPost': appPost?.toJson(),
      if (userProfileId != null) 'userProfileId': userProfileId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PostCommentImpl extends PostComment {
  _PostCommentImpl({
    int? id,
    required String content,
    required int appPostId,
    _i2.AppPost? appPost,
    int? userProfileId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          content: content,
          appPostId: appPostId,
          appPost: appPost,
          userProfileId: userProfileId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [PostComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PostComment copyWith({
    Object? id = _Undefined,
    String? content,
    int? appPostId,
    Object? appPost = _Undefined,
    Object? userProfileId = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return PostComment(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      appPostId: appPostId ?? this.appPostId,
      appPost: appPost is _i2.AppPost? ? appPost : this.appPost?.copyWith(),
      userProfileId: userProfileId is int? ? userProfileId : this.userProfileId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
