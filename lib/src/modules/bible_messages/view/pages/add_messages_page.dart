import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class AddMessagesPage extends StatefulWidget {
  const AddMessagesPage({super.key});

  @override
  State<AddMessagesPage> createState() => _AddMessagesPageState();
}

class _AddMessagesPageState extends State<AddMessagesPage> {
  @override
  Widget build(BuildContext context) {
    String? memberId = Modular.args.params["memberId"];

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final pageCenterSpacing = height * 0.4;
    final iconSize = height * 0.03;
    final titleFontSize = height * 0.035;
    final textFontSize = height * 0.017;
    final buttonFontSize = height * 0.02;
    final buttonPadding = height * 0.015;

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
              const Spacer(),
              Text(
                "Aqui você pode criar uma nova mensagem, ou gerá-la automaticamente. Após a criação, a nova mensagem permanecerá em sua lista pessoal e poderá ser compartilhada na linha do tempo.",
                style: TextStyle(fontSize: textFontSize, height: 0),
              ),
              SizedBox(height: pageCenterSpacing),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton(
                    showBorder: true,
                    primaryColor: AppThemes.primaryColor1,
                    widget: Icon(Icons.email_outlined, color: AppThemes.primaryColor1, size: iconSize),
                    fontSize: buttonFontSize,
                    text: "Gerar Mensagem",
                    onTap: () => Modular.to.pushNamed('../message_generation/$memberId'),
                  ),
                  SizedBox(height: buttonPadding),
                  AppButton(
                    primaryColor: Colors.white,
                    backgroundColor: AppThemes.primaryColor1,
                    widget: Icon(Icons.note_add_outlined, color: Colors.white, size: iconSize),
                    fontSize: buttonFontSize,
                    text: "Criar Mensagem",
                    onTap: () => Modular.to.pushNamed('../create_message/$memberId'),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 2),
    );
  }
}
