// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:app_ibnt/src/app_imports.dart';

class EventBanner extends StatelessWidget {
  EventBanner({
    Key? key,
    required this.event,
    required this.widgetHeight,
    required this.onTap,
  }) : super(key: key);

  final EventEntity event;
  final double widgetHeight;
  final void Function() onTap;
  ValueNotifier<bool> showOptions = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final imageContainerSize = height * 0.075;
    final eventNameFontSize = height * 0.02;
    final eventDateFontSize = height * 0.017;
    final commonBloc = context.read<CommonEventBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            SizedBox(
              height: widgetHeight,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: imageContainerSize,
                    width: imageContainerSize,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppThemes.primaryColor1, width: .7),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            event.imageUrlPath(),
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              event.title ?? "",
                              style: TextStyle(
                                fontSize: eventNameFontSize,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            event.eventDate(),
                            style: TextStyle(
                              fontSize: eventDateFontSize,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.start,
                            event.description ?? "",
                            style: TextStyle(
                              fontSize: eventDateFontSize,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedBuilder(
                    animation: showOptions,
                    builder: ((context, child) {
                      return Visibility(
                        visible: showOptions.value,
                        child: Container(
                          height: widgetHeight * 0.55,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 0.7,
                                color: AppThemes.primaryColor1,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: Column(
                              children: [
                                AppButton(
                                  height: 45,
                                  width: width,
                                  showBorder: true,
                                  primaryColor: AppThemes.primaryColor1,
                                  text: "Editar",
                                  onTap: () {
                                    showOptions.value = false;
                                  },
                                  widget: const Icon(
                                    Icons.edit,
                                    color: AppThemes.primaryColor1,
                                  ),
                                  fontSize: 17,
                                ),
                                const Spacer(),
                                AppButton(
                                  height: 45,
                                  width: width,
                                  showBorder: true,
                                  primaryColor: AppThemes.primaryColor1,
                                  text: "Excluir",
                                  onTap: () {
                                    callAppDialog(
                                      context,
                                      "Excluir Evento",
                                      "Deseja excluir o evento ${event.title}?",
                                      () {
                                        commonBloc.add(DeleteCommonEventEvent(event));
                                        ScaffoldMessenger.of(context).clearMaterialBanners();
                                      },
                                      () {
                                        ScaffoldMessenger.of(context).clearMaterialBanners();
                                      },
                                    );
                                    showOptions.value = false;
                                  },
                                  widget: const Icon(
                                    Icons.delete_outline,
                                    color: AppThemes.primaryColor1,
                                  ),
                                  fontSize: 17,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  IconButton(
                    onPressed: () {
                      showOptions.value = true;
                    },
                    icon: const Icon(Icons.menu_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
