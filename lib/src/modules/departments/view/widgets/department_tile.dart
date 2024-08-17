// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ibnt/src/app_imports.dart';

class DepartmentTile extends StatefulWidget {
  const DepartmentTile({Key? key, required this.department, required this.onTap}) : super(key: key);

  final DepartmentEntity department;
  final void Function() onTap;

  @override
  State<DepartmentTile> createState() => _DepartmentTileState();
}

class _DepartmentTileState extends State<DepartmentTile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final containerGeneralSize = height * 0.075;
    final componentsSeparatorSize = width * 0.022;
    const tileRadius = 4.0;
    const tileTopPadding = 12.0;
    const tileInternalPadding = 8.0;
    const departmentTitleFontSize = 20.0;
    const departmentInfoFontSize = 16.0;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: tileTopPadding),
        child: Row(
          children: [
            Container(
              height: containerGeneralSize,
              width: containerGeneralSize,
              decoration: BoxDecoration(
                border: Border.all(color: AppThemes.primaryColor1, width: 1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: AssetImage(
                  "assets/images/ibnt_logo.png",
                )),
              ),
            ),
            SizedBox(width: componentsSeparatorSize),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tileRadius),
                  border: Border.all(color: AppThemes.primaryColor1, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(tileInternalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.department.title ?? "",
                        style: const TextStyle(
                          fontSize: departmentTitleFontSize,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Karma',
                          color: AppThemes.primaryColor1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Membros",
                            style: TextStyle(
                              fontSize: departmentInfoFontSize,
                              color: AppThemes.primaryColor1,
                            ),
                          ),
                          Text(
                            widget.department.members?.length.toString() ?? "",
                            style: const TextStyle(
                              fontSize: departmentInfoFontSize,
                              color: AppThemes.primaryColor1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
