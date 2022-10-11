import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:flutter_map_redux/enumeration/enumeration.dart';
import 'package:flutter_map_redux/state/actions/main_action.dart';
import 'package:flutter_map_redux/state/models/app_state.dart' as appState;
import 'package:flutter_map_redux/state/reducers/app_reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart' as redux;

void main() {
  runApp(MaterialApp(
    title: 'Flutter demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

class HomePage extends hooks.HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = redux.Store(appStateReducer,
        initialState: const appState.State(items: [], filter: ItemFilter.all));

    final textController = hooks.useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: StoreProvider(
        store: store,
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      store.dispatch(
                          const ChangeFilterTypeAction(ItemFilter.all));
                    },
                    child: const Text('All')),
                TextButton(
                    onPressed: () {
                      store.dispatch(
                          const ChangeFilterTypeAction(ItemFilter.shortTexts));
                    },
                    child: const Text('Short items')),
                TextButton(
                    onPressed: () {
                      store.dispatch(
                          const ChangeFilterTypeAction(ItemFilter.longTexts));
                    },
                    child: const Text('Large Items'))
              ],
            ),
            TextField(
              controller: textController,
            ),
            Row(children: [
              TextButton(
                  onPressed: () {
                    final text = textController.text;
                    store.dispatch(AddItemAction(text));
                    textController.clear();
                  },
                  child: const Text('Add')),
              TextButton(
                  onPressed: () {
                    final text = textController.text;
                    store.dispatch(RemoveItemAction(text));
                    textController.clear();
                  },
                  child: const Text('Remove')),
            ]),
            StoreConnector<appState.State, Iterable<String>>(
              converter: (store) => store.state.filteredItems,
              builder: (context, items) {
                return Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, position) =>
                            const Divider(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items.elementAt(index);
                          return ListTile(title: Text(item));
                        }));
              },
            )
          ],
        ),
      ),
    );
  }
}
