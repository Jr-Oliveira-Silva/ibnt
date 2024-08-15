// ignore_for_file: use_build_context_synchronously

import 'package:app_ibnt/src/modules/home/home_imports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _pageIndex = 0;
  late UserBloc userBloc;
  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>();
    userBloc.add(GetMemberByIdEvent(Modular.args.params["memberId"]));
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;
    final cameraIconSize = height * 0.03;
    final profileContainerSize = height * 0.20;
    final profileNameFontSize = height * 0.036;
    final profileEmailFontSize = height * 0.018;
    final subtitleFontSize = height * 0.028;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        preferredSize: Size(width, height * 0.08),
        actions: [
          BlocConsumer(
            bloc: authBloc,
            listener: (context, state) async {
              if (state is AuthSignOutState) {
                await Future.delayed(const Duration(seconds: 1));
                Modular.to.navigate('/');
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  callAppDialog(
                    context,
                    "Sair do App",
                    "Deseja sair do app IBNT?",
                    () {
                      authBloc.add(SignOutEvent());
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    },
                    () {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    },
                  );
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right_sharp,
                ),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: BlocBuilder(
            bloc: userBloc,
            builder: (context, state) {
              if (state is GetUserLoadingUserState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is GetUserSuccessState) {
                final user = state.user;
                user.departments ??= [];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Perfil",
                          style: TextStyle(
                            fontSize: titleFontSize,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final imagePicker = ImagePicker();
                            final galleryImage = await imagePicker.pickImage(source: ImageSource.gallery);
                            if (galleryImage == null) {
                              _imageStatusSnackBar(context, AppThemes.secondaryColor1, "Nenhuma imagem selecionada.");
                            } else {
                              final imageFile = XFile(galleryImage.path);
                              userBloc.add(SetMemberProfileImageEvent(imageFile, user.id!));
                            }
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: AppThemes.primaryColor1,
                            size: cameraIconSize,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Column(
                      children: [
                        Container(
                          height: profileContainerSize,
                          width: profileContainerSize,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppThemes.primaryColor1),
                            shape: BoxShape.circle,
                            image: user.profileImage != null
                                ? DecorationImage(
                                    image: NetworkImage(user.imageUrl()),
                                    fit: BoxFit.cover,
                                  )
                                : const DecorationImage(
                                    image: AssetImage("assets/images/ibnt_logo.png"),
                                  ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          user.fullName ?? "",
                          style: TextStyle(
                            fontFamily: 'Karma',
                            fontSize: profileNameFontSize,
                          ),
                        ),
                        Text(
                          user.userCredential?.email ?? "",
                          style: TextStyle(fontFamily: 'Karma', fontSize: profileEmailFontSize, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                    user.departments!.isNotEmpty
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Departamentos",
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                              ),
                            ),
                          )
                        : Container(),
                    user.departments!.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: user.departments!.length,
                              itemBuilder: (_, i) {
                                final department = user.departments![i];
                                return DepartmentTile(
                                  department: department,
                                  onTap: () {},
                                );
                              },
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                "Nenhum Departamento",
                                style: TextStyle(
                                  fontSize: subtitleFontSize,
                                ),
                              ),
                              const Text(
                                "Você não está associado a nenhum departamento no momento.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}

_imageStatusSnackBar(BuildContext context, Color modalColor, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: modalColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      duration: const Duration(
        seconds: 5,
      ),
      content: SizedBox(
        height: 65,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}
