// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/app_imports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = Modular.get<AuthBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final menuFontSize = height * 0.04;
    final menuHorizontalPadding = height * 0.01;
    final verticalDrawerPdding = height * 0.07;
    final horizontalDrawerPdding = width * 0.035;
    final verticalTilePadding = width * 0.045;
    final drawerTileFontSize = height * 0.025;
    final drawerIconSize = height * 0.045;
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthSignOutState) {
          Modular.to.navigate('/');
        }
      },
      builder: (context, state) {
        return Drawer(
          width: width * 0.8,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: verticalDrawerPdding, horizontal: horizontalDrawerPdding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: verticalTilePadding, horizontal: menuHorizontalPadding),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: menuFontSize,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: verticalTilePadding),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.person_2_outlined, size: drawerIconSize),
                      title: Text(
                        "Perfil",
                        style: TextStyle(
                          fontSize: drawerTileFontSize,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: verticalTilePadding),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.file_copy_outlined, size: drawerIconSize),
                      title: Text(
                        "Departamentos",
                        style: TextStyle(
                          fontSize: drawerTileFontSize,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: verticalTilePadding),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.view_comfortable_outlined, size: drawerIconSize),
                      title: Text(
                        "Escalas",
                        style: TextStyle(
                          fontSize: drawerTileFontSize,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => authBloc.add(SignOutEvent()),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sair do App",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
