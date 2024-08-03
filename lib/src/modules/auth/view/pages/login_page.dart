import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool obscured = true;
  final formKey = GlobalKey<FormState>();
  Credential authEntity = Credential(email: "", password: "");
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final textFontSize = height * 0.027;
    double buttonHeight = 60;
    double buttonFontSize = 18;
    double horizontalPadding = 10;
    double mainHeightSpacing = height * 0.015;

    sendEmailPageNavigation() => Modular.to.pushNamed('./send_email');
    registerPageNavigation() => Modular.to.pushNamed('./register');
    setVisibility() => setState(() => obscured = !obscured);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoComponent(logoHeight: height * 0.15, verticalPadding: height * 0.13),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFieldLabel(label: "E-mail"),
                      AppTextField(
                        onChanged: (value) => authEntity.email = value,
                        fieldName: "e-mail",
                      ),
                      TextFieldLabel(label: "Senha"),
                      AppTextField(
                        onChanged: (value) => authEntity.password = value,
                        fieldName: "campo senha",
                        iconTap: setVisibility,
                        obscureText: obscured,
                        passwordField: true,
                      ),
                      Align(
                        alignment:Alignment.centerRight,
                        child: TextButton(
                          onPressed: sendEmailPageNavigation,
                          child: const Text(
                            "Esqueci minha senha",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      BlocConsumer(
                        bloc: authBloc,
                        listener: (context, state) {
                          if (state is AuthFailureState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: AppThemes.secondaryColor1,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                content: Center(
                                  child: Text(
                                    state.message,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (state is AuthSuccessState) {
                            Modular.to.navigate('/auth/home/');
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoadingState) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return AppButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                authBloc.add(SignInWithAuthEntityEvent(authEntity));
                              }
                            },
                            height: buttonHeight,
                            width: width,
                            primaryColor: Colors.white,
                            backgroundColor: AppThemes.primaryColor1,
                            fontSize: buttonFontSize,
                            text: "Entrar",
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: registerPageNavigation,
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: textFontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: mainHeightSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
