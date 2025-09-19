/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../feed/app_post.dart' as _i2;

abstract class PostComment
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = PostCommentTable();

  static const db = PostCommentRepository._();

  @override
  int? id;

  String content;

  int appPostId;

  _i2.AppPost? appPost;

  int? userProfileId;

  DateTime? createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'appPostId': appPostId,
      if (appPost != null) 'appPost': appPost?.toJsonForProtocol(),
      if (userProfileId != null) 'userProfileId': userProfileId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static PostCommentInclude include({_i2.AppPostInclude? appPost}) {
    return PostCommentInclude._(appPost: appPost);
  }

  static PostCommentIncludeList includeList({
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    PostCommentInclude? include,
  }) {
    return PostCommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PostComment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PostComment.t),
      include: include,
    );
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

class PostCommentTable extends _i1.Table<int?> {
  PostCommentTable({super.tableRelation}) : super(tableName: 'post_comment') {
    content = _i1.ColumnString(
      'content',
      this,
    );
    appPostId = _i1.ColumnInt(
      'appPostId',
      this,
    );
    userProfileId = _i1.ColumnInt(
      'userProfileId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnString content;

  late final _i1.ColumnInt appPostId;

  _i2.AppPostTable? _appPost;

  late final _i1.ColumnInt userProfileId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.AppPostTable get appPost {
    if (_appPost != null) return _appPost!;
    _appPost = _i1.createRelationTable(
      relationFieldName: 'appPost',
      field: PostComment.t.appPostId,
      foreignField: _i2.AppPost.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppPostTable(tableRelation: foreignTableRelation),
    );
    return _appPost!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        content,
        appPostId,
        userProfileId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'appPost') {
      return appPost;
    }
    return null;
  }
}

class PostCommentInclude extends _i1.IncludeObject {
  PostCommentInclude._({_i2.AppPostInclude? appPost}) {
    _appPost = appPost;
  }

  _i2.AppPostInclude? _appPost;

  @override
  Map<String, _i1.Include?> get includes => {'appPost': _appPost};

  @override
  _i1.Table<int?> get table => PostComment.t;
}

class PostCommentIncludeList extends _i1.IncludeList {
  PostCommentIncludeList._({
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PostComment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PostComment.t;
}

class PostCommentRepository {
  const PostCommentRepository._();

  final attachRow = const PostCommentAttachRowRepository._();

  /// Returns a list of [PostComment]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<PostComment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.find<PostComment>(
      where: where?.call(PostComment.t),
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PostComment] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<PostComment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? offset,
    _i1.OrderByBuilder<PostCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PostCommentTable>? orderByList,
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.findFirstRow<PostComment>(
      where: where?.call(PostComment.t),
      orderBy: orderBy?.call(PostComment.t),
      orderByList: orderByList?.call(PostComment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PostComment] by its [id] or null if no such row exists.
  Future<PostComment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PostCommentInclude? include,
  }) async {
    return session.db.findById<PostComment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PostComment]s in the list and returns the inserted rows.
  ///
  /// The returned [PostComment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PostComment>> insert(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PostComment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PostComment] and returns the inserted row.
  ///
  /// The returned [PostComment] will have its `id` field set.
  Future<PostComment> insertRow(
    _i1.Session session,
    PostComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PostComment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PostComment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PostComment>> update(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.ColumnSelections<PostCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PostComment>(
      rows,
      columns: columns?.call(PostComment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PostComment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PostComment> updateRow(
    _i1.Session session,
    PostComment row, {
    _i1.ColumnSelections<PostCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PostComment>(
      row,
      columns: columns?.call(PostComment.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PostComment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PostComment>> delete(
    _i1.Session session,
    List<PostComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PostComment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PostComment].
  Future<PostComment> deleteRow(
    _i1.Session session,
    PostComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PostComment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PostComment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PostCommentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PostComment>(
      where: where(PostComment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PostCommentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PostComment>(
      where: where?.call(PostComment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PostCommentAttachRowRepository {
  const PostCommentAttachRowRepository._();

  /// Creates a relation between the given [PostComment] and [AppPost]
  /// by setting the [PostComment]'s foreign key `appPostId` to refer to the [AppPost].
  Future<void> appPost(
    _i1.Session session,
    PostComment postComment,
    _i2.AppPost appPost, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (appPost.id == null) {
      throw ArgumentError.notNull('appPost.id');
    }

    var $postComment = postComment.copyWith(appPostId: appPost.id);
    await session.db.updateRow<PostComment>(
      $postComment,
      columns: [PostComment.t.appPostId],
      transaction: transaction,
    );
  }
}
