// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetTextCollection on Isar {
  IsarCollection<int, Text> get texts => this.collection();
}

const TextSchema = IsarCollectionSchema(
  schema:
      '{"name":"Text","idName":"id","properties":[{"name":"text","type":"String"}]}',
  converter: IsarObjectConverter<int, Text>(
    serialize: serializeText,
    deserialize: deserializeText,
    deserializeProperty: deserializeTextProp,
  ),
  embeddedSchemas: [],
  //hash: -6684291194938812420,
);

@isarProtected
int serializeText(IsarWriter writer, Text object) {
  {
    final value = object.text;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, value);
    }
  }
  return object.id;
}

@isarProtected
Text deserializeText(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String? _text;
  _text = IsarCore.readString(reader, 1);
  final object = Text(
    _id,
    _text,
  );
  return object;
}

@isarProtected
dynamic deserializeTextProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _TextUpdate {
  bool call({
    required int id,
    String? text,
  });
}

class _TextUpdateImpl implements _TextUpdate {
  const _TextUpdateImpl(this.collection);

  final IsarCollection<int, Text> collection;

  @override
  bool call({
    required int id,
    Object? text = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (text != ignore) 1: text as String?,
        }) >
        0;
  }
}

sealed class _TextUpdateAll {
  int call({
    required List<int> id,
    String? text,
  });
}

class _TextUpdateAllImpl implements _TextUpdateAll {
  const _TextUpdateAllImpl(this.collection);

  final IsarCollection<int, Text> collection;

  @override
  int call({
    required List<int> id,
    Object? text = ignore,
  }) {
    return collection.updateProperties(id, {
      if (text != ignore) 1: text as String?,
    });
  }
}

extension TextUpdate on IsarCollection<int, Text> {
  _TextUpdate get update => _TextUpdateImpl(this);

  _TextUpdateAll get updateAll => _TextUpdateAllImpl(this);
}

sealed class _TextQueryUpdate {
  int call({
    String? text,
  });
}

class _TextQueryUpdateImpl implements _TextQueryUpdate {
  const _TextQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Text> query;
  final int? limit;

  @override
  int call({
    Object? text = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (text != ignore) 1: text as String?,
    });
  }
}

extension TextQueryUpdate on IsarQuery<Text> {
  _TextQueryUpdate get updateFirst => _TextQueryUpdateImpl(this, limit: 1);

  _TextQueryUpdate get updateAll => _TextQueryUpdateImpl(this);
}

extension TextQueryFilter on QueryBuilder<Text, Text, QFilterCondition> {
  QueryBuilder<Text, Text, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Text, Text, QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }
}

extension TextQueryObject on QueryBuilder<Text, Text, QFilterCondition> {}

extension TextQuerySortBy on QueryBuilder<Text, Text, QSortBy> {
  QueryBuilder<Text, Text, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Text, Text, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Text, Text, QAfterSortBy> sortByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Text, Text, QAfterSortBy> sortByTextDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension TextQuerySortThenBy on QueryBuilder<Text, Text, QSortThenBy> {
  QueryBuilder<Text, Text, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Text, Text, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Text, Text, QAfterSortBy> thenByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Text, Text, QAfterSortBy> thenByTextDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension TextQueryWhereDistinct on QueryBuilder<Text, Text, QDistinct> {
  QueryBuilder<Text, Text, QAfterDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }
}

extension TextQueryProperty1 on QueryBuilder<Text, Text, QProperty> {
  QueryBuilder<Text, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Text, String?, QAfterProperty> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension TextQueryProperty2<R> on QueryBuilder<Text, R, QAfterProperty> {
  QueryBuilder<Text, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Text, (R, String?), QAfterProperty> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension TextQueryProperty3<R1, R2>
    on QueryBuilder<Text, (R1, R2), QAfterProperty> {
  QueryBuilder<Text, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Text, (R1, R2, String?), QOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Text _$TextFromJson(Map<String, dynamic> json) => Text(
      json['id'] as int,
      json['text'] as String?,
    );

Map<String, dynamic> _$TextToJson(Text instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
