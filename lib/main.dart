import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upstreet_flutter_code_challenge/constants.dart';
import 'package:upstreet_flutter_code_challenge/posts/bloc/posts_bloc.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';

import './screens/album_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(PostAdapter());
  await Hive.openBox(POSTS_BOX);
  runApp(BlocProvider(
    create: (context) => PostsBloc()..add(GetPosts()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upstreet Flutter code challenge',
      theme: ThemeData(
        primaryColor: const Color(0xff01046d),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AlbumList(),
    );
  }
}

// Logs events and states during transition
class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}
