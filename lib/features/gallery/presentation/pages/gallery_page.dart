import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/injection_container.dart';
import 'package:gallery_app/core/resources/resources.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/bloc.dart';
import 'package:gallery_app/features/gallery/presentation/widgets/photo_item_widget.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GalleryBloc>()..add(GalleryLoadEvent()),
      child: const GalleryView(),
    );
  }
}

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsApp.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.telegram_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: BlocConsumer<GalleryBloc, GalleryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GalleryInitial) {
            return Container();
          }
          if (state is GalleryLoadingState) {
            return const CircularProgressIndicator(color: Colors.white);
          }

          if (state is GalleryLoadedState) {
            return Center(
              child: ListView.builder(
                itemCount: state.loadedPhotos.length,
                itemBuilder: (context, index) {
                  return PhotoItemWidget(photoModel: state.loadedPhotos[index]);
                },
              ),
            );
          }

          if (state is GalleryErrorState) {
            return const Text(StringsApp.noData);
          }
          return Container();
        },
      ),
    );
  }
}
