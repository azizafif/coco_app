import 'package:coco_app/search/data/model/object_model.dart';
import 'package:coco_app/search/controllers/search_controller.dart';
import 'package:coco_app/search/widgets/custom_chip.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_tag_editor/tag_editor.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<String> values = [];
  List<String> catsNames = [];
  List<int> ids = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getCatsNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COCO App')),
      body: GetBuilder<SearchController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: TagEditor(
                      length: values.length,
                      delimiters: const [','],
                      hasAddButton: true,
                      inputDecoration: const InputDecoration(
                        hintText: 'Add an object...',
                      ),
                      onTagChanged: (newValue) {
                        if (isExist(newValue, catsNames)) {
                          setState(() {
                            values.add(newValue);
                          });
                        }
                      },
                      tagBuilder: (context, index) => CustomChip(
                            index: index,
                            label: values[index],
                            onDeleted: _onDelete,
                          ),
                      suggestionBuilder: (context, state, data) => ListTile(
                            key: ObjectKey(data),
                            title: Text(data),
                            onTap: () {
                              state.selectSuggestion(data);
                            },
                          ),
                      suggestionsBoxElevation: 10,
                      findSuggestions: (String query) {
                        return [];
                      }),
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    controller.cleanData();
                    controller.getCats(ids: getIds(values));
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
              controller.imagesList.isNotEmpty
                  ? SizedBox(
                      height: controller.imagesList.length * 20,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.imagesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: 70,
                                child: Image.network(
                                  controller.imagesList[index].cocoaUrl ?? '',
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(child: Text("No data"))
            ],
          ),
        );
      }),
    );
  }

  getCatsNames() {
    setState(() {
      for (var e in cats) {
        catsNames.add(e.name);
      }
    });
  }

  _onDelete(index) {
    setState(() {
      values.removeAt(index);
    });
  }

//? Checking if an element exist or not in a list
  bool isExist<T>(T newValue, List<T> listOf) {
    return listOf.contains(newValue);
  }

//? Getting a list of categories ids
  List<int> getIds(List<String> values) {
    List<int> ids = [];
    for (var e in cats) {
      values.contains(e.name) && !isExist(e.id, ids) ? ids.add(e.id) : ids;
    }
    return ids;
  }
}
