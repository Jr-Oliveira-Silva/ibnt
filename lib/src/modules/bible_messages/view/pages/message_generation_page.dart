import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class MessageGenerationPage extends StatefulWidget {
  const MessageGenerationPage({super.key});

  @override
  State<MessageGenerationPage> createState() => _MessageGenerationPageState();
}

int _pageIndex = 2;
final bibleVersions = ["acf", "apee", "bbe", "kjv", "nvi", "ra", "rvr"];
final testaments = ["VT", "NT"];
late NewMessageEntity newGeneratedMessage;

class _MessageGenerationPageState extends State<MessageGenerationPage> {
  @override
  void initState() {
    super.initState();
    String memberId = Modular.args.params["memberId"];
    newGeneratedMessage = NewMessageEntity(memberId: memberId);
  }

  @override
  Widget build(BuildContext context) {
    final bibleMessagesBloc = context.read<BibleMessagesBloc>();
    final bookCubit = context.read<BibleBookCubit>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final buttonFontSize = height * 0.02;
    final pagePadding = width * 0.035;
    final titleFontSize = height * 0.035;
    return Scaffold(
      backgroundColor: Colors.white,
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
              SizedBox(height: height * 0.06),
              AppDropDown<String>(
                items: [...bibleVersions],
                fieldLabel: "Versão",
                hintText: "Escolha a versão",
                onChanged: (value) => newGeneratedMessage.bibleVersion = value ?? "",
              ),
              SizedBox(height: height * 0.01),
              AppDropDown<String>(
                items: [...testaments],
                fieldLabel: "Testamento",
                hintText: "Escolha o Testamento",
                onChanged: (value) {
                  newGeneratedMessage.testment = value ?? "";
                  bookCubit.setBooksList(value ?? "VT");
                },
              ),
              SizedBox(height: height * 0.01),
              BlocBuilder<BibleBookCubit, List<BibleBookEntity>>(
                  bloc: bookCubit,
                  builder: (_, state) {
                    var bookNames = state.map((book) => book.name).toList();
                    return bookCubit.loading
                        ? Padding(
                            padding: EdgeInsets.only(top: height * 0.07),
                            child: const LinearProgressIndicator(),
                          )
                        : AppDropDown<String>(
                            items: [...bookNames],
                            fieldLabel: "Livro",
                            hintText: "Escolha o Livro",
                            onChanged: (value) {
                              var abbreviation = state.where((book) => book.name == value).first.abbrev;
                              newGeneratedMessage.book = abbreviation.pt;
                            },
                          );
                  }),
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
                      text: "Gerar Mensagem Automática",
                      onTap: () => newGeneratedMessage.validMessage()
                          ? //
                          bibleMessagesBloc.add(GenerateMessageEvent(newGeneratedMessage))
                          : //
                          callAppToast(context, "Por favor, preencha os campos."),
                    );
                  }),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
