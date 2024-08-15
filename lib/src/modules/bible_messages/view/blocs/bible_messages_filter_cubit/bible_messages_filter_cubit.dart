import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessagesFilterCubit extends Cubit<List<BibleMessageEntity>> {
  BibleMessagesFilterCubit() : super([]);

  bool loading = false;

  void filterBibleMessages(String? value, List<BibleMessageEntity> messagesList) {
    loading = true;
    state.clear();
    emit([]);
    if (value != null) {
      var currentList = messagesList.where((message) {
        var filter = value.toLowerCase();
        return message.title.toLowerCase().contains(filter) ||
            message.content.toLowerCase().contains(filter);
      }).toList();

      state.addAll(currentList);
      loading = false;
      emit(currentList);
    }
    loading = false;
  }
}
