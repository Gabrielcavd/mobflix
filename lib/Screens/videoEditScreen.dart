import 'package:flutter/material.dart';
import '../Data/videoCard_dao.dart';
import '../Data/categoriesData.dart';
import '../Components/videoCard.dart';

class videoEditScreen extends StatefulWidget {
  final String url;
  final String categorieName;
  final int categorieColor;

  const videoEditScreen(
      {Key? key,
      required this.url,
      required this.categorieName,
      required this.categorieColor})
      : super(key: key);

  @override
  State<videoEditScreen> createState() => _videoEditScreenState();
}

class _videoEditScreenState extends State<videoEditScreen> {
  TextEditingController urlController = TextEditingController();
  TextEditingController categorieNameController = TextEditingController();
  int colorController = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    urlController.text = widget.url;
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  final List<String> keysList = categoryMap.keys.toList();
  final List<int> valuesList = categoryMap.values.toList();

  int verifyCategorie(String categorieName) {
    final List<String> keysList = categoryMap.keys.toList();
    for (int i = 0; i < keysList.length; i++) {
      if (categorieName == keysList[i]) {
        return 1;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        resizeToAvoidBottomInset: false,
        body: Container(
          padding:
              const EdgeInsets.only(top: 55, left: 20, right: 20, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edite o Vídeo',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: Text(
                  'URL:',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Insira uma URL válida");
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  setState(() {});
                },
                cursorColor: Colors.black,
                controller: urlController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Ex: Kod3h2g_dIg',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8),
                child: Text(
                  'Categoria:',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty || verifyCategorie(value) == 0) {
                    return ("Insira uma categoria válida");
                  } else {
                    return null;
                  }
                },
                cursorColor: Colors.black,
                controller: categorieNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Ação, Terror...',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Preview',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://img.youtube.com/vi/${urlController.text}/maxresdefault.jpg',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Icon(
                        Icons.ondemand_video_outlined,
                        size: 60,
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      colorController = valuesList[
                          (keysList.indexOf(categorieNameController.text))];
                      await videoCardDao().save(videoCard(
                          url: urlController.text,
                          categorieName: categorieNameController.text,
                          categorieColor: colorController));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Vídeo editado com sucesso!')));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Editar Video'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
