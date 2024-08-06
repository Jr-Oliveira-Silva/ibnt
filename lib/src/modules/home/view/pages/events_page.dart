import 'package:app_ibnt/src/app_imports.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final titleFontSize = height * 0.035;
    final pagePadding = width * 0.035;
    final imageContainerSize = height * 0.075;
    final eventNameFontSize = height * 0.02;
    final eventDateFontSize = height * 0.017;

    return Scaffold(
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Eventos",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: SizedBox(
                        height: 192,
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
                                image: const DecorationImage(
                                    image: AssetImage(
                                  "assets/images/ibnt_logo.png",
                                )),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nome do Evento",
                                    style: TextStyle(
                                      fontSize: eventNameFontSize,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "Data Do Evento",
                                      style: TextStyle(
                                        fontSize: eventDateFontSize,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      "adsjfakjhsdfkljasldkfjahlsdkjfalksjdfhalksjdflkjasdlfkjasldfjkalsdkjfalsdkjfhlakjsdfhlakjsdflkajsdhflkajsdfhlakjsdfhlakjsdfhlakjsdfhlaksjdfhlakjsdfhlakjsdfhlakjsdhflkajsdfhlkajsdhlfkjasdhlfkjasdlfkjasdlkfhalsdkjfhlaskdjf",
                                      style: TextStyle(
                                        fontSize: 17,
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
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
