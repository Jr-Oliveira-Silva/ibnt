import 'package:app_ibnt/src/modules/auth/auth_imports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool passwordConfirmationObscured = true;
  String passwordConfirmation = "";

  CreateUserEntity newUserEntity = CreateUserEntity(
      fullName: "",
      credential: Credential(
        email: "",
        password: "",
      ));

  @override
  Widget build(BuildContext context) {
    final createUserBloc = context.read<CreateUserBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          TextFieldLabel(label: "Nome Completo"),
                          AppTextField(
                            onChanged: (value) => newUserEntity.fullName = value,
                          ),
                          TextFieldLabel(label: "E-mail"),
                          AppTextField(
                            onChanged: (value) => newUserEntity.credential.email = value,
                          ),
                          TextFieldLabel(label: "Senha"),
                          AppTextField(
                            obscureText: obscure,
                            onChanged: (value) => newUserEntity.credential.password = value,
                            passwordField: true,
                            iconTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                          ),
                          TextFieldLabel(label: "Confirmar Senha"),
                          AppTextField(
                            obscureText: passwordConfirmationObscured,
                            onChanged: (value) => passwordConfirmation = value,
                            passwordField: true,
                            iconTap: () {
                              setState(() {
                                passwordConfirmationObscured = !passwordConfirmationObscured;
                              });
                            },
                          ),
                          SizedBox(height: height * 0.025),
                          BlocConsumer(
                            bloc: createUserBloc,
                            listener: (context, state) async {
                              if (state is CreateUserFailureState) {
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
                              if (state is CreateUserSuccessState) {
                                await setUserTokenToGlobalVariable(state.authResponse.token!, null);
                                Modular.to.navigate('/auth/home/');
                              }
                            },
                            builder: (context, state) {
                              if (state is CreateUserLoadingState) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return AppButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    if (newUserEntity.credential.password == passwordConfirmation) {
                                      createUserBloc.add(CreateUserEvent(newUserEntity));
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          margin: EdgeInsets.symmetric(vertical: height * 0.12, horizontal: 10),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: AppThemes.secondaryColor1,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                          content: const Center(child: Text("As senhas não podem ser divergentes.")),
                                        ),
                                      );
                                    }
                                  }
                                },
                                height: 60,
                                width: width,
                                primaryColor: Colors.white,
                                backgroundColor: AppThemes.primaryColor1,
                                fontSize: 18,
                                text: "Criar Conta",
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
              "Criar Conta",
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
