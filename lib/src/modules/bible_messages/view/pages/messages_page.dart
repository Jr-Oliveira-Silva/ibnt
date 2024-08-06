import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';
import 'package:app_ibnt/src/modules/bible_messages/view/widgets/message_menu_widget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

int _pageIndex = 2;

class _MessagesPageState extends State<MessagesPage> {
  String memberId = Modular.args.params["memberId"];

  @override
  Widget build(BuildContext context) {
    final getMemberMessagesBloc = context.read<GetMemberMessagesBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final titleFontSize = height * 0.035;
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
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Mensagens Bíblicas",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              MessageMenuWidget(getMemberMessagesBloc: getMemberMessagesBloc),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('./add_messages/$memberId'),
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}
