// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

class DepartmentMemberTile extends StatelessWidget {
  const DepartmentMemberTile({Key? key, required this.member, required this.button}) : super(key: key);

  final DepartmentMember member;
  final AppButton button;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final containerGeneralSize = height * 0.095;
    const memberNameFontSize = 32.0;
    const memberInfoFontSize = 16.0;
    const externalPadding = 8.0;
    const containerRightPadding = 24.0;
    const columnTextPadding = 12.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: externalPadding),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: containerRightPadding),
              child: Container(
                height: containerGeneralSize,
                width: containerGeneralSize,
                decoration: BoxDecoration(
                  border: Border.all(color: AppThemes.primaryColor1, width: 1),
                  shape: BoxShape.circle,
                  image: member.profileImage != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            member.imageUrl(),
                          ))
                      : const DecorationImage(
                          image: AssetImage(
                          "assets/images/ibnt_logo.png",
                        )),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: columnTextPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      member.fullName ?? "",
                      style: const TextStyle(
                        fontFamily: "Karma",
                        fontWeight: FontWeight.w600,
                        fontSize: memberNameFontSize,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            member.email ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: memberInfoFontSize,
                            ),
                          ),
                        ),
                        button
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
