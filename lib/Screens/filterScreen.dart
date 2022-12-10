import 'package:challange_mobile_alura/Components/categorie.dart';
import 'package:challange_mobile_alura/Screens/videoEditScreen.dart';
import 'package:flutter/material.dart';
import '../Data/videoCard_dao.dart';
import '../Components/videoCard.dart';

class filterScreen extends StatelessWidget {
  final String categorieName;
  final int categorieColor;

  const filterScreen(
      {Key? key, required this.categorieName, required this.categorieColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'MOBFLIX',
          style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Container(
        color: Colors.black87,
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Categoria: ',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(categorieColor)),
                    child: Text(categorieName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: FutureBuilder<List<videoCard>>(
                    future: videoCardDao().findCategorie(categorieName),
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
                          break;
                        case ConnectionState.waiting:
                          return Center(
                            child: Column(
                              children: const [
                                CircularProgressIndicator(),
                                Text('Carregando'),
                              ],
                            ),
                          );
                          break;
                        case ConnectionState.active:
                          return Center(
                            child: Column(
                              children: const [
                                CircularProgressIndicator(),
                                Text('Carregando'),
                              ],
                            ),
                          );
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasData && itens != null) {
                            if (itens.isNotEmpty) {
                              return ListView.builder(
                                  itemCount: itens.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final videoCard video = itens[index];
                                    return Dismissible(
                                      key: ValueKey<videoCard>(video),
                                      background: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        color: Color(0xFF222223),
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                          size: 30,
                                        ),
                                      ),
                                      secondaryBackground: Container(
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
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
                                          Navigator.pushNamedAndRemoveUntil(
                                              context, '/homePage', ModalRoute.withName('/'));
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
                                    'Não há nenhum vídeo dessa categoria',
                                    style: TextStyle(fontSize: 32),
                                  )
                                ],
                              ),
                            );
                          }
                          return Text('Erro ao carregar tarefas');
                          break;
                      }
                      return Text('Erro desconhecido');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
