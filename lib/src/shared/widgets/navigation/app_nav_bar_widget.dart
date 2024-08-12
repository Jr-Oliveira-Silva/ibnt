// ignore_for_file: must_be_immutable
import 'package:app_ibnt/src/app_imports.dart';

class AppNavBarWidget extends StatefulWidget {
  AppNavBarWidget({required this.pageIndex, super.key});
  int pageIndex;

  @override
  State<AppNavBarWidget> createState() => _AppNavBarWidgetState();
}

late String _memberId;

Future<void> _setUserData() async {
  final preferences = await SharedPreferences.getInstance();
  final userJson = preferences.getString("user");
  if (userJson != null) {
    final userMap = jsonDecode(userJson);
    _memberId = userMap["id"];
  }
}

class _AppNavBarWidgetState extends State<AppNavBarWidget> {
  @override
  void initState() {
    super.initState();
    _setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: AppThemes.primaryColor1,
      currentIndex: widget.pageIndex,
      unselectedIconTheme: const IconThemeData(color: AppThemes.secondaryColor1),
      unselectedItemColor: AppThemes.secondaryColor1,
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(color: AppThemes.primaryColor1),
      selectedLabelStyle: const TextStyle(color: AppThemes.primaryColor1, fontWeight: FontWeight.w600),
      onTap: _setPageIndex,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Perfil",
          icon: Icon(
            Icons.person_rounded,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Início",
          icon: Icon(
            Icons.home_sharp,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Mensagens",
          icon: Icon(
            Icons.menu_book_sharp,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Avisos",
          icon: Icon(
            Icons.dataset,
          ),
        ),
      ],
    );
  }

  _setPageIndex(int value) {
    setState(() {
      widget.pageIndex = value;
    });
    switch (value) {
      case 0:
        Modular.to.navigate('/auth/home/profile/$_memberId');
        break;
      case 1:
        Modular.to.navigate('/auth/home/');
        break;
      case 2:
        Modular.to.navigate('/auth/home/bible_messages/$_memberId');
        break;
      case 3:
        Modular.to.navigate('/auth/home/warnings/$_memberId');
        break;
    }
  }
}
