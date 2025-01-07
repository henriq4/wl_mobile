import 'package:flutter_test/flutter_test.dart';
import 'package:Taski/modules/home/view_models/item_list_view_model.dart';

void main() {
  group('ItemListViewModel Tests', () {
    late ItemListViewModel viewModel;

    setUp(() {
      viewModel = ItemListViewModel();
    });

    test('Initial items list should have 1 item', () {
      expect(viewModel.items.length, 1);
    });

    test('Add item to the list', () {
      final initialItemCount = viewModel.items.length;
      viewModel.addItem('New Task', 'Task description');
      expect(viewModel.items.length, initialItemCount + 1);
    });

    test('Delete an item from the list', () {
      final item = viewModel.items[0];
      viewModel.deleteItem(item);
      expect(viewModel.items.length, 0);
      expect(viewModel.items.contains(item), false);
    });

    test('Delete all completed items', () {
      final item = viewModel.items[0];
      viewModel.toggleItemCompletion(item, 0);

      expect(viewModel.completedItemsCount, 1);

      viewModel.deleteAllDone();

      expect(viewModel.completedItemsCount, 0);
    });

    test('Search task by name with matching results', () {
      viewModel.searchTaskByName('sign up');
      expect(viewModel.filteredItems.length, 1);
    });

    test('Search task by name with no results', () {
      viewModel.searchTaskByName('non-existing task');
      expect(viewModel.filteredItems.isEmpty, true);
    });

    test('Toggle item completion', () {
      final item = viewModel.items[0];
      final initialCompletionState = item.isCompleted;
      viewModel.toggleItemCompletion(item, 0);

      expect(item.isCompleted, !initialCompletionState);
    });

    test('Get completed items count', () {
      final item = viewModel.items[0];
      viewModel.toggleItemCompletion(item, 0);

      expect(viewModel.completedItemsCount, 1);
    });

    test('Get pending items count', () {
      final item = viewModel.items[0];
      viewModel.toggleItemCompletion(item, 0);

      expect(viewModel.pendingItemsCount, 0);
    });
  });
}
