import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_createv_app/domain/entites/article.dart';
import 'package:news_createv_app/presentation/controllers/bloc/artical_bloc.dart';

import '/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget('News')),
      body: _scaffoldBody(),
    );
    /* GetBuilder<AppThemeController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: SwitchListTile(
              title: Text(controller.getDarkTheme ? 'Dark' : 'Light'),
              secondary: Icon(
                controller.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: controller.getDarkTheme,
              onChanged: (bool value) => controller.setDarkTheme = value),
        ),
      );
    }); */
  }

  _scaffoldBody() => BlocBuilder<RemoteArticleBloc, RemoteArticalState>(
        builder: (context, state) {
          if (state is RemoteArticalLoading) {
            //return lodingDisplay();
            return const CircularProgressIndicator();
          }
          if (state is RemoteArticalException) {
            // return errorDisplay();
            // debugPrint("Error>>>>>>>>> $state");
            debugPrint("Error>>>>>>>>> ${state.exception!.message}");
            return const Icon(Icons.error);
          }

          if (state is RemoteArticalDone) {
            // return dataDisplay();
            return ListView.builder(
              itemCount: state.article!.length,
              itemBuilder: (context, index) {
                final ArticleEntity data = state.article![index];
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${data.urlToImage}"),
                      ),
                    ),
                  ),
                  title: Text(
                    '${data.title}',
                    style:
                        const TextStyle(fontSize: 20, color: AppColors.orang),
                    maxLines: 2,
                  ),
                  subtitle: Text(
                    'Published at: ${data.publishedAt}\nAuthor Name: ${data.author} \nDescription :\n${data.description}',
                    // style: const TextStyle(fontSize: 18),
                  ),
                  // trailing: Row(children: [
                  //   ElevatedButton(onPressed: () {}, child: const Text('Read')),
                  //   const Padding(padding: EdgeInsets.all(2)),
                  //   OutlinedButton(onPressed: () {}, child: const Text('Save'))
                  // ]),
                );
              },
            );
          }
          return Container();
        },
      );
}
