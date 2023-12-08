import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  String _selectedEstado = 'Selecione';
  String _selectedPais = 'Selecione';
  String _selectedNacionalidade = 'Selecione';
  
  @override
  void initState() {
    // Simule dados do usuário ou obtenha do armazenamento local
    _nomeController.text = 'Nome do Usuário';
    _emailController.text = 'email@example.com';
    _telefoneController.text = '123456789';
    _selectedEstado = 'Estado 1';
    _selectedPais = 'Pais 1';
    _selectedNacionalidade = 'Nacionalidade 1';

    super.initState();
  }

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
                  Modular.to.pushNamed('/initial');
                },
              ),
              ListTile(
                title: const Text('Perfil', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Implemente a ação ao clicar em Perfil
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
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildTextFieldWithLabel('Nome', _nomeController),
              buildTextFieldWithLabel('Email', _emailController),
              buildTextFieldWithLabel('Telefone', _telefoneController),
              buildDropdownWithLabel('Estado', _selectedEstado, _estados),
              buildDropdownWithLabel('Pais', _selectedPais, _paises),
              buildDropdownWithLabel('Nacionalidade', _selectedNacionalidade, _nacionalidades),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Coloque sua lógica para salvar as alterações aqui
                  // Exemplo: atualizar dados no armazenamento local ou enviar para um servidor
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alterações salvas com sucesso!')),
                  );
                },
                child: const Text('Salvar Alterações'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldWithLabel(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildDropdownWithLabel(String label, dynamic selectedValue, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  List<String> _estados = ['Selecione', 'Estado 1', 'Estado 2', 'Estado 3'];
  List<String> _paises = ['Selecione', 'Pais 1', 'Pais 2', 'Pais 3'];
  List<String> _nacionalidades = ['Selecione', 'Nacionalidade 1', 'Nacionalidade 2', 'Nacionalidade 3'];
}
