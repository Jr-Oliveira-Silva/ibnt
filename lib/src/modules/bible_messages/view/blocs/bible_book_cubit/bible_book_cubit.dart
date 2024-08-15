import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleBookCubit extends Cubit<List<BibleBookEntity>> {
  BibleBookCubit() : super([]);

  bool loading = false;

  void setBooksList(String testament) async {
    state.clear();
    emit([]);
    loading = true;
    await Future.delayed(const Duration(milliseconds: 400));
    var books = bibleBooks.map((book) => BibleBookEntity.fromMap(book)).toList();
    var selectedBooks = books.where((book) => book.testament == testament).toList();
    state.addAll(selectedBooks);
    loading = false;
    emit(selectedBooks);
  }
}
