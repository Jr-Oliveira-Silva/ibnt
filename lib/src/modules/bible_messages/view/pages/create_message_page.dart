import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class CreateMessagePage extends StatefulWidget {
  const CreateMessagePage({super.key});

  @override
  State<CreateMessagePage> createState() => _CreateMessagePageState();
}

int _pageIndex = 2;
late NewMessageEntity newMessage;
final _formKey = GlobalKey<FormState>();

class _CreateMessagePageState extends State<CreateMessagePage> {
  @override
  void initState() {
    super.initState();
    String memberId = Modular.args.params["memberId"];
    newMessage = NewMessageEntity(memberId: memberId);
  }

  @override
  Widget build(BuildContext context) {
    final bibleMessagesBloc = context.read<BibleMessagesBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final buttonFontSize = height * 0.02;
    final pagePadding = width * 0.035;
    final titleFontSize = height * 0.035;
    final labelFontSize = height * 0.025;
    const contentMaxLines = 6;

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: height * 0.8,
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
                SizedBox(height: height * 0.06),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextFieldLabel(
                              label: "Título",
                              fontSize: labelFontSize,
                            )),
                        AppTextField(
                          fieldName: "o título.",
                          onChanged: (value) => newMessage.title = value,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextFieldLabel(
                              label: "Mensagem",
                              fontSize: labelFontSize,
                            )),
                        AppTextField(
                          fieldName: "o conteúdo da mensagem.",
                          maxLines: contentMaxLines,
                          maxLength: 1000,
                          onChanged: (value) => newMessage.content = value,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextFieldLabel(
                              label: "Texto Base",
                              fontSize: labelFontSize,
                            )),
                        AppTextField(
                          fieldName: "o texto base.",
                          onChanged: (value) => newMessage.baseText = value,
                        ),
                      ],
                    )),
                const Spacer(),
                BlocConsumer(
                  bloc: bibleMessagesBloc,
                  listener: (_, state) {
                    if (state is BibleMessagesFailureState) {
                      callAppToast(context, state.exception);
                    }
                    if (state is BibleMessagesSuccessState) {
                      Modular.to.pushNamed("../message", arguments: {"message": state.message});
                    }
                  },
                  builder: (_, state) {
                    if (state is BibleMessagesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return AppButton(
                      primaryColor: Colors.white,
                      backgroundColor: AppThemes.primaryColor1,
                      fontSize: buttonFontSize,
                      text: "Salvar",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          bibleMessagesBloc.add(CreateMessageEvent(newMessage));
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}
