import 'package:aplication_search_artic/app/modules/initial/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int selectedArticleCount = 1;
  String selectedLanguage = 'Portuguese';

  List<Article> articles = []; // Lista de artigos

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticSearch Registration', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 247, 113, 113),
         elevation: 0, // Remover a sombra da AppBar
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 247, 113, 113),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'ArticSearch',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(), // Adiciona uma linha separadora
              ListTile(
                title: const Text('Inicial', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Implemente a ação ao clicar em Inicial
                  // Modular.to.pushNamed('/initial');
                },
              ),
              ListTile(
                title: const Text('Perfil', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Implemente a ação ao clicar em Perfil
                  //Modular.to.pushNamed('/profile');
                  // Contorno
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfilePage()));
                },
              ),
              ListTile(
                title: const Text('Sair', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Implemente a ação ao clicar em Sair
                  Modular.to.popAndPushNamed(Modular.initialRoute);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Digite sua busca...',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Linguagem', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<String>(
                      value: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                      items: ['Portuguese', 'English', 'Spanish']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quantidade de Artigos', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<int>(
                      value: selectedArticleCount,
                      onChanged: (value) {
                        setState(() {
                          selectedArticleCount = value!;
                        });
                      },
                      items: [1, 2, 5, 10, 20].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Ao clicar em pesquisar, atualiza a lista de artigos
                    _searchArticles();
                  },
                  child: Text('Pesquisar'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(articles[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(articles[index].description),
                          Text(articles[index].authors),
                        ],
                      ),
                      trailing: Container(
                        width: 50, // Largura do botão redondo
                        height: 50, // Altura do botão redondo
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add_link, color: Colors.white),
                          onPressed: () {
                            // Adicione a lógica desejada para o botão aqui
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchArticles() {
    // Simule uma busca de artigos com os filtros selecionados
    List<Article> filteredArticles = List.generate(
      selectedArticleCount,
      (index) => Article(
        title: 'Título do Artigo $index',
        description: 'Descrição do artigo $index',
        authors: 'Nome dos autores $index',
      ),
    );

    // Atualize a lista de artigos
    setState(() {
      articles = filteredArticles;
    });
  }
}

class Article {
  final String title;
  final String description;
  final String authors;

  Article({
    required this.title,
    required this.description,
    required this.authors,
  });
}