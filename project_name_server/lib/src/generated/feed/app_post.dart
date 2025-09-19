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
import '../feed/post_comment.dart' as _i2;

abstract class AppPost
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = AppPostTable();

  static const db = AppPostRepository._();

  @override
  int? id;

  String content;

  int? userProfileId;

  DateTime? createdAt;

  DateTime? updatedAt;

  List<_i2.PostComment>? comments;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
      if (userProfileId != null) 'userProfileId': userProfileId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (comments != null)
        'comments': comments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static AppPostInclude include({_i2.PostCommentIncludeList? comments}) {
    return AppPostInclude._(comments: comments);
  }

  static AppPostIncludeList includeList({
    _i1.WhereExpressionBuilder<AppPostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppPostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppPostTable>? orderByList,
    AppPostInclude? include,
  }) {
    return AppPostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppPost.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppPost.t),
      include: include,
    );
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

class AppPostTable extends _i1.Table<int?> {
  AppPostTable({super.tableRelation}) : super(tableName: 'app_post') {
    content = _i1.ColumnString(
      'content',
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

  late final _i1.ColumnInt userProfileId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.PostCommentTable? ___comments;

  _i1.ManyRelation<_i2.PostCommentTable>? _comments;

  _i2.PostCommentTable get __comments {
    if (___comments != null) return ___comments!;
    ___comments = _i1.createRelationTable(
      relationFieldName: '__comments',
      field: AppPost.t.id,
      foreignField: _i2.PostComment.t.appPostId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostCommentTable(tableRelation: foreignTableRelation),
    );
    return ___comments!;
  }

  _i1.ManyRelation<_i2.PostCommentTable> get comments {
    if (_comments != null) return _comments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'comments',
      field: AppPost.t.id,
      foreignField: _i2.PostComment.t.appPostId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PostCommentTable(tableRelation: foreignTableRelation),
    );
    _comments = _i1.ManyRelation<_i2.PostCommentTable>(
      tableWithRelations: relationTable,
      table: _i2.PostCommentTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _comments!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        content,
        userProfileId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'comments') {
      return __comments;
    }
    return null;
  }
}

class AppPostInclude extends _i1.IncludeObject {
  AppPostInclude._({_i2.PostCommentIncludeList? comments}) {
    _comments = comments;
  }

  _i2.PostCommentIncludeList? _comments;

  @override
  Map<String, _i1.Include?> get includes => {'comments': _comments};

  @override
  _i1.Table<int?> get table => AppPost.t;
}

class AppPostIncludeList extends _i1.IncludeList {
  AppPostIncludeList._({
    _i1.WhereExpressionBuilder<AppPostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppPost.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AppPost.t;
}

class AppPostRepository {
  const AppPostRepository._();

  final attach = const AppPostAttachRepository._();

  final attachRow = const AppPostAttachRowRepository._();

  final detach = const AppPostDetachRepository._();

  final detachRow = const AppPostDetachRowRepository._();

  /// Returns a list of [AppPost]s matching the given query parameters.
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
  Future<List<AppPost>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppPostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppPostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppPostTable>? orderByList,
    _i1.Transaction? transaction,
    AppPostInclude? include,
  }) async {
    return session.db.find<AppPost>(
      where: where?.call(AppPost.t),
      orderBy: orderBy?.call(AppPost.t),
      orderByList: orderByList?.call(AppPost.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AppPost] matching the given query parameters.
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
  Future<AppPost?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppPostTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppPostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppPostTable>? orderByList,
    _i1.Transaction? transaction,
    AppPostInclude? include,
  }) async {
    return session.db.findFirstRow<AppPost>(
      where: where?.call(AppPost.t),
      orderBy: orderBy?.call(AppPost.t),
      orderByList: orderByList?.call(AppPost.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AppPost] by its [id] or null if no such row exists.
  Future<AppPost?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppPostInclude? include,
  }) async {
    return session.db.findById<AppPost>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AppPost]s in the list and returns the inserted rows.
  ///
  /// The returned [AppPost]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppPost>> insert(
    _i1.Session session,
    List<AppPost> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppPost>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppPost] and returns the inserted row.
  ///
  /// The returned [AppPost] will have its `id` field set.
  Future<AppPost> insertRow(
    _i1.Session session,
    AppPost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppPost>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppPost]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppPost>> update(
    _i1.Session session,
    List<AppPost> rows, {
    _i1.ColumnSelections<AppPostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppPost>(
      rows,
      columns: columns?.call(AppPost.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppPost]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppPost> updateRow(
    _i1.Session session,
    AppPost row, {
    _i1.ColumnSelections<AppPostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppPost>(
      row,
      columns: columns?.call(AppPost.t),
      transaction: transaction,
    );
  }

  /// Deletes all [AppPost]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppPost>> delete(
    _i1.Session session,
    List<AppPost> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppPost>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppPost].
  Future<AppPost> deleteRow(
    _i1.Session session,
    AppPost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppPost>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppPost>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppPostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppPost>(
      where: where(AppPost.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppPostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppPost>(
      where: where?.call(AppPost.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppPostAttachRepository {
  const AppPostAttachRepository._();

  /// Creates a relation between this [AppPost] and the given [PostComment]s
  /// by setting each [PostComment]'s foreign key `appPostId` to refer to this [AppPost].
  Future<void> comments(
    _i1.Session session,
    AppPost appPost,
    List<_i2.PostComment> postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (appPost.id == null) {
      throw ArgumentError.notNull('appPost.id');
    }

    var $postComment =
        postComment.map((e) => e.copyWith(appPostId: appPost.id)).toList();
    await session.db.update<_i2.PostComment>(
      $postComment,
      columns: [_i2.PostComment.t.appPostId],
      transaction: transaction,
    );
  }
}

class AppPostAttachRowRepository {
  const AppPostAttachRowRepository._();

  /// Creates a relation between this [AppPost] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `appPostId` to refer to this [AppPost].
  Future<void> comments(
    _i1.Session session,
    AppPost appPost,
    _i2.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }
    if (appPost.id == null) {
      throw ArgumentError.notNull('appPost.id');
    }

    var $postComment = postComment.copyWith(appPostId: appPost.id);
    await session.db.updateRow<_i2.PostComment>(
      $postComment,
      columns: [_i2.PostComment.t.appPostId],
      transaction: transaction,
    );
  }
}

class AppPostDetachRepository {
  const AppPostDetachRepository._();

  /// Detaches the relation between this [AppPost] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `appPostId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> comments(
    _i1.Session session,
    List<_i2.PostComment> postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('postComment.id');
    }

    var $postComment =
        postComment.map((e) => e.copyWith(appPostId: null)).toList();
    await session.db.update<_i2.PostComment>(
      $postComment,
      columns: [_i2.PostComment.t.appPostId],
      transaction: transaction,
    );
  }
}

class AppPostDetachRowRepository {
  const AppPostDetachRowRepository._();

  /// Detaches the relation between this [AppPost] and the given [PostComment]
  /// by setting the [PostComment]'s foreign key `appPostId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> comments(
    _i1.Session session,
    _i2.PostComment postComment, {
    _i1.Transaction? transaction,
  }) async {
    if (postComment.id == null) {
      throw ArgumentError.notNull('postComment.id');
    }

    var $postComment = postComment.copyWith(appPostId: null);
    await session.db.updateRow<_i2.PostComment>(
      $postComment,
      columns: [_i2.PostComment.t.appPostId],
      transaction: transaction,
    );
  }
}
