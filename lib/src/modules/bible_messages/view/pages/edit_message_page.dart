// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class EditMessagePage extends StatefulWidget {
  EditMessagePage({required this.message, super.key});

  BibleMessageEntity message;

  @override
  State<EditMessagePage> createState() => _EditMessagePageState();
}

int _pageIndex = 2;
final _formKey = GlobalKey<FormState>();

class _EditMessagePageState extends State<EditMessagePage> {
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
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SingleChildScrollView(
        child: SizedBox(
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
                          initialValue: widget.message.title,
                          fieldName: "o título.",
                          onChanged: (value) => widget.message.title = value,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextFieldLabel(
                              label: "Mensagem",
                              fontSize: labelFontSize,
                            )),
                        AppTextField(
                          initialValue: widget.message.content,
                          fieldName: "o conteúdo da mensagem.",
                          maxLines: contentMaxLines,
                          maxLength: 1000,
                          onChanged: (value) => widget.message.content = value,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextFieldLabel(
                              label: "Texto Base",
                              fontSize: labelFontSize,
                            )),
                        AppTextField(
                          initialValue: widget.message.baseText,
                          fieldName: "o texto base.",
                          onChanged: (value) => widget.message.baseText = value,
                        ),
                      ],
                    )),
                SizedBox(height: height * 0.04),
                BlocConsumer(
                    bloc: bibleMessagesBloc,
                    listener: (_, state) {
                      if (state is UpdateBibleMessageFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: AppThemes.secondaryColor1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            content: Center(
                              child: Text(
                                state.exception,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is UpdateBibleMessageSuccessState) {
                        Modular.to.popAndPushNamed("./message", arguments: {"message": state.message});
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
                        text: "Atualizar",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bibleMessagesBloc.add(UpdateMessageEvent(widget.message));
                          }
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}
