import 'package:app_ibnt/src/modules/posts/posts_imports.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => PostsPageState();
}

class PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(
        drawerOptions: [
          AppDrawerTile(
            tileName: 'Perfil',
            leadingIcon: Icons.person_2_outlined,
            onTap: () {},
          ),
          AppDrawerTile(
            tileName: 'Departamentos',
            leadingIcon: Icons.file_copy_outlined,
            onTap: () {},
          ),
          AppDrawerTile(
            tileName: 'Eventos',
            leadingIcon: Icons.event,
            onTap: () {},
          ),
          AppDrawerTile(
            tileName: 'Escalas',
            leadingIcon: Icons.view_comfortable_outlined,
            onTap: () {},
          ),
        ],
      ),
      appBar: AppBarWidget(preferredSize: Size(width, 80)),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 0),
    );
  }
}
