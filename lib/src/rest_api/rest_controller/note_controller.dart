import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/demo_color_utils.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/note_quick_form.dart';

// *****************************************************************************
// *****************************************************************************

void noteRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/note-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getNoteInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/note-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getNoteInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/note-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/note-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final noteId = int.parse(request.path.split('/').last);
          return await getNoteDetail(request, noteId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/note-data/quick-update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await quickUpdateNote(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/note-data/quick-create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await quickCreateNote(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/note/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final noteId = int.parse(request.path.split('/').last);
          return await deleteNote(request, noteId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getNoteInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<NoteData> allNoteDatas = await (db.select(db.note)).get();
  //
  List<NoteInfo> noteInfos = allNoteDatas
      .map((e) => NoteInfo.fromEntity(e))
      .toList();

  NoteInfoPage p = NoteInfoPage(items: noteInfos, paginationInfo: null);
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getNoteInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<NoteData> allNoteDatas = await (db.select(
    db.note,
  )..where((e) => e.title.containsCase(searchText))).get();
  //
  PageData<NoteData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allNoteDatas,
  );
  PageData<NoteInfo> page = pageData.convert(
    converter: (noteData) => NoteInfo.fromEntity(noteData),
  );
  NoteInfoPage p = NoteInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// NoteDetail.
Future<MockResponse> getNoteDetail(MockRequest request, int noteId) async {
  final SharedDatabase db = await getSharedDatabase();

  NoteData? entity = await db.noteDAO.findById(noteId);

  if (entity == null) {
    return MockResponse.json({});
  }
  NoteDetail detail = NoteDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> quickUpdateNote(MockRequest request) async {
  FormData formData = request.body;
  final NoteQuickForm form = NoteQuickForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  await db.update(db.note)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      NoteCompanion(title: Value(form.title), content: Value(form.content)),
    );
  //
  final NoteData? note = await db.noteDAO.findById(form.id!);
  //
  if (note == null) {
    return MockResponse.json({});
  } else {
    NoteDetail detail = NoteDetail.fromEntity(note);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> quickCreateNote(MockRequest request) async {
  FormData formData = request.body;
  final NoteQuickForm form = NoteQuickForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  final noteId = await db
      .into(db.note)
      .insert(
        NoteCompanion.insert(
          title: form.title,
          content: form.content,
          createDateTime: DateTime.now(),
          colorCode: DemoColorUtils.getRandomHex16ColorCode(),
        ),
      );
  //
  final NoteData? note = await db.noteDAO.findById(noteId);
  //
  if (note == null) {
    return MockResponse.json({});
  } else {
    NoteDetail detail = NoteDetail.fromEntity(note);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteNote(MockRequest request, int noteId) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final NoteData? note = await db.noteDAO.findById(noteId);
  if (note == null) {
    return MockResponse.json({});
  }
  //
  await db.noteDAO.deleteById(noteId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************
