import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_search/data/photo_notifier.dart';
import 'package:image_search/ui/widget/photo_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //성공 상태의 값만 꺼내서 보여줌.
    final asyncPhotos = ref.watch(photoNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('이미지 검색 앱', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await ref
                        .read(photoNotifierProvider.notifier)
                        .search(_searchController.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: switch (asyncPhotos) {
                AsyncLoading() => Center(
                  child: CircularProgressIndicator(color: Colors.blueGrey),
                ),
                AsyncError(:final error) => Center(
                  child: Text('에러 발생: $error'),
                ),
                AsyncData(value: final photos) => GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: asyncPhotos.value.length,
                  itemBuilder: (ctx, index) =>
                      PhotoWidget(photo: asyncPhotos.value[index]),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
