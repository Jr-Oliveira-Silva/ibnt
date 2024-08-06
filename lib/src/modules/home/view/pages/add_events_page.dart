// ignore_for_file: use_build_context_synchronously

import 'package:app_ibnt/src/modules/home/home_imports.dart';

class AddEventsPage extends StatefulWidget {
  const AddEventsPage({super.key});

  @override
  State<AddEventsPage> createState() => _AddEventsPageState();
}

class _AddEventsPageState extends State<AddEventsPage> {
  final formKey = GlobalKey<FormState>();

  final newEvent = EventEntity();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.04;
    final cameraIconSize = height * 0.04;
    final labelFontSize = height * 0.025;
    final pagePadding = width * 0.035;

    final cubit = context.watch<DateCubit>();
    final createEventBloc = context.read<CreateEventBloc>();

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
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Eventos",
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
                        newEvent.imageField = imageFile;
                        _imageStatusSnackBar(context, AppThemes.secondaryColor1, "Nova imagem adicionada.");
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
              SizedBox(height: height * 0.05),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldLabel(label: "Título", fontSize: labelFontSize),
                    AppTextField(
                      fieldName: 'o título',
                      onChanged: (value) => newEvent.title = value,
                    ),
                    TextFieldLabel(label: "Descrição", fontSize: labelFontSize),
                    AppTextField(
                      fieldName: 'a descrição',
                      onChanged: (value) => newEvent.description = value,
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
              const AppDateWidget(),
              SizedBox(height: height * 0.02),
              BlocConsumer(
                bloc: createEventBloc,
                listener: (context, state) {
                  if (state is CreateEventFailureState) {
                    callAppToast(context, state.message);
                  }
                  if (state is CreateEventSuccessState) {
                    Modular.to.navigate("/auth/home/");
                  }
                },
                builder: (context, state) {
                  if (state is CreateEventLoadingState) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  return AppButton(
                    onTap: () {
                      if (newEvent.imageField == null || !formKey.currentState!.validate()) {
                        _imageStatusSnackBar(context, AppThemes.secondaryColor1, "Por favor, forneça os dados e selecione uma imagem para o evento.");
                      } else {
                        final eventDate = "${cubit.state.year}-${cubit.state.month}-${cubit.state.day}";
                        newEvent.date = eventDate;
                        newEvent.postDate = eventDate;
                        createEventBloc.add(CreateEventEvent(newEvent));
                      }
                    },
                    height: 60,
                    width: width,
                    primaryColor: Colors.white,
                    backgroundColor: AppThemes.primaryColor1,
                    fontSize: 18,
                    text: "Adicionar",
                  );
                },
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
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
