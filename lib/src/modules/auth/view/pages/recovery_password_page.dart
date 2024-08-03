import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => RecoveryPasswordPageState();
}

class RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  AuthRecoveryEntity recoveryEntity = Modular.args.data;
  bool obscured = true;
  bool passwordConfirmationObscured = true;
  String passwordConfirmation = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final recoveryPasswordBloc = context.read<RecoveryPasswordBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final emailFontSize = height * 0.02;
    double buttonHeight = 60;
    double buttonFontSize = 18;
    double horizontalPadding = 10;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: ListView(
                  children: [
                    LogoComponent(logoHeight: height * 0.15, verticalPadding: height * 0.085),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                const Text("Um código de verificação foi enviado para o e-mail:"),
                                Text(
                                  recoveryEntity.verificationEmail,
                                  style: TextStyle(fontSize: emailFontSize, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.085),
                          TextFieldLabel(label: "Código de Verificação"),
                          AppTextField(onChanged: (value) => recoveryEntity.verificationCode = value),
                          TextFieldLabel(label: "Senha"),
                          AppTextField(
                            obscureText: obscured,
                            passwordField: true,
                            onChanged: (value) => recoveryEntity.newPassword = value,
                            iconTap: () {
                              setState(() {
                                obscured = !obscured;
                              });
                            },
                          ),
                          TextFieldLabel(label: "Confirmar Senha"),
                          AppTextField(
                            obscureText: passwordConfirmationObscured,
                            passwordField: true,
                            onChanged: (value) => passwordConfirmation = value,
                            iconTap: () {
                              setState(() {
                                passwordConfirmationObscured = !passwordConfirmationObscured;
                              });
                            },
                          ),
                          SizedBox(height: height * 0.02),
                          BlocConsumer(
                            bloc: recoveryPasswordBloc,
                            listener: (context, state) {
                              if (state is PasswordDefinitionFailureState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: AppThemes.secondaryColor1,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                    content: Center(child: Text(state.message)),
                                  ),
                                );
                              }
                              if (state is PasswordDefinitionSuccessState) {
                                Modular.to.pushReplacementNamed("./login");
                              }
                            },
                            builder: (context, state) {
                              if (state is RecoveryPasswordLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return AppButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    if (passwordConfirmation != recoveryEntity.newPassword) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: AppThemes.secondaryColor1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                          content: const Center(child: Text("As senhas informadas são divergentes. Por favor, informe o mesmo valor no campo Senha e Confirmar Senha.")),
                                        ),
                                      );
                                    } else {
                                      recoveryPasswordBloc.add(RedefinePasswordEvent(recoveryEntity));
                                    }
                                  }
                                },
                                height: buttonHeight,
                                width: width,
                                primaryColor: Colors.white,
                                backgroundColor: AppThemes.primaryColor1,
                                fontSize: buttonFontSize,
                                text: "Redefinir Senha",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.05,
            left: 10,
            child: const Text(
              "Recuperar Senha",
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
