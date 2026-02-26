import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_client.dart';

class SupabaseDataSource {
  SupabaseDataSource._();

  static SupabaseClient get _client => SupabaseConfig.client;

  // Generic CRUD operations

  /// Fetch all records from a table
  static Future<List<Map<String, dynamic>>> fetchAll(
    String table, {
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    PostgrestFilterBuilder<PostgrestList> query = _client.from(table).select();

    if (orderBy != null && limit != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending).limit(limit);
      return response;
    } else if (orderBy != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending);
      return response;
    } else if (limit != null) {
      final List<Map<String, dynamic>> response = await query.limit(limit);
      return response;
    }

    final List<Map<String, dynamic>> response = await query;
    return response;
  }

  /// Fetch a single record by ID
  static Future<Map<String, dynamic>?> fetchById(
    String table,
    String id,
  ) async {
    final Map<String, dynamic>? response =
        await _client.from(table).select().eq('id', id).maybeSingle();
    return response;
  }

  /// Fetch records with a filter
  static Future<List<Map<String, dynamic>>> fetchWhere(
    String table, {
    required String column,
    required Object value,
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    PostgrestFilterBuilder<PostgrestList> query =
        _client.from(table).select().eq(column, value);

    if (orderBy != null && limit != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending).limit(limit);
      return response;
    } else if (orderBy != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending);
      return response;
    } else if (limit != null) {
      final List<Map<String, dynamic>> response = await query.limit(limit);
      return response;
    }

    final List<Map<String, dynamic>> response = await query;
    return response;
  }

  /// Fetch records with multiple filters
  static Future<List<Map<String, dynamic>>> fetchWhereMultiple(
    String table, {
    required Map<String, Object> filters,
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    PostgrestFilterBuilder<PostgrestList> query = _client.from(table).select();

    for (final MapEntry<String, Object> entry in filters.entries) {
      query = query.eq(entry.key, entry.value);
    }

    if (orderBy != null && limit != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending).limit(limit);
      return response;
    } else if (orderBy != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending);
      return response;
    } else if (limit != null) {
      final List<Map<String, dynamic>> response = await query.limit(limit);
      return response;
    }

    final List<Map<String, dynamic>> response = await query;
    return response;
  }

  /// Insert a record
  static Future<Map<String, dynamic>?> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    final Map<String, dynamic> response =
        await _client.from(table).insert(data).select().single();
    return response;
  }

  /// Insert multiple records
  static Future<List<Map<String, dynamic>>> insertMany(
    String table,
    List<Map<String, dynamic>> data,
  ) async {
    final List<Map<String, dynamic>> response =
        await _client.from(table).insert(data).select();
    return response;
  }

  /// Update a record by ID
  static Future<Map<String, dynamic>?> update(
    String table,
    String id,
    Map<String, dynamic> data,
  ) async {
    final Map<String, dynamic> response =
        await _client.from(table).update(data).eq('id', id).select().single();
    return response;
  }

  /// Delete a record by ID
  static Future<void> delete(
    String table,
    String id,
  ) async {
    await _client.from(table).delete().eq('id', id);
  }

  /// Fetch featured records (is_featured = true)
  static Future<List<Map<String, dynamic>>> fetchFeatured(
    String table, {
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    return fetchWhere(
      table,
      column: 'is_featured',
      value: true,
      orderBy: orderBy,
      ascending: ascending,
      limit: limit,
    );
  }

  /// Count records in a table
  static Future<int> count(
    String table, {
    Map<String, Object>? filters,
  }) async {
    PostgrestFilterBuilder<PostgrestList> query = _client.from(table).select();

    if (filters != null) {
      for (final MapEntry<String, Object> entry in filters.entries) {
        query = query.eq(entry.key, entry.value);
      }
    }

    final PostgrestResponse<PostgrestList> response =
        await query.count(CountOption.exact);
    return response.count;
  }

  /// Search in a text column
  static Future<List<Map<String, dynamic>>> search(
    String table, {
    required String column,
    required String searchQuery,
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    PostgrestFilterBuilder<PostgrestList> query =
        _client.from(table).select().ilike(column, '%$searchQuery%');

    if (orderBy != null && limit != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending).limit(limit);
      return response;
    } else if (orderBy != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending);
      return response;
    } else if (limit != null) {
      final List<Map<String, dynamic>> response = await query.limit(limit);
      return response;
    }

    final List<Map<String, dynamic>> response = await query;
    return response;
  }

  /// Paginated fetch
  static Future<List<Map<String, dynamic>>> fetchPaginated(
    String table, {
    required int page,
    required int pageSize,
    String? orderBy,
    bool ascending = true,
    Map<String, Object>? filters,
  }) async {
    final int from = page * pageSize;
    final int to = from + pageSize - 1;

    PostgrestFilterBuilder<PostgrestList> query = _client.from(table).select();

    if (filters != null) {
      for (final MapEntry<String, Object> entry in filters.entries) {
        query = query.eq(entry.key, entry.value);
      }
    }

    if (orderBy != null) {
      final List<Map<String, dynamic>> response =
          await query.order(orderBy, ascending: ascending).range(from, to);
      return response;
    }

    final List<Map<String, dynamic>> response = await query.range(from, to);
    return response;
  }
}
