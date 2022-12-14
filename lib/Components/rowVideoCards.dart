import 'package:challange_mobile_alura/Data/videoCard_dao.dart';
import 'package:challange_mobile_alura/Screens/videoEditScreen.dart';
import 'package:challange_mobile_alura/Components/videoCard.dart';
import 'package:flutter/material.dart';

class rowVideoCard extends StatefulWidget {
  const rowVideoCard({Key? key}) : super(key: key);

  @override
  State<rowVideoCard> createState() => _rowVideoCardState();
}

class _rowVideoCardState extends State<rowVideoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: FutureBuilder<List<videoCard>>(
          future: videoCardDao().findAll(),
          builder: (context, snapshot) {
            List<videoCard>? itens = snapshot.data?.reversed.toList();
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && itens != null) {
                  if (itens.isNotEmpty) {
                    return ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (BuildContext context, int index) {
                          final videoCard video = itens[index];
                          return Dismissible(
                            key: ValueKey<videoCard>(video),
                            background: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              color: Color(0xFF222223),
                              child: Icon(
                                Icons.edit,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                            secondaryBackground: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              color: Color(0xFF222223),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                videoCardDao().delete(itens[index].url);
                              } else {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => videoEditScreen(
                                        url: video.url,
                                        categorieName: video.categorieName,
                                        categorieColor: video.categorieColor),
                                  ),
                                );
                              }
                            },
                            child: video,
                          );
                        });
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.error_outline,
                          size: 120,
                        ),
                        Text(
                          'N??o h?? nenhum v??deo',
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar tarefas');
            }
          }),
    );
  }
}
