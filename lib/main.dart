import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lakukan pengecekan username dan password di sini
                String username = usernameController.text;
                String password = passwordController.text;
                // Contoh sederhana pengecekan
                if (username == 'admin' && password == 'password') {
                  // Navigasi ke halaman selanjutnya jika login berhasil
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                } else {
                  // Tampilkan pesan kesalahan jika login gagal
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Login Gagal'),
                        content: const Text('Username atau Password Salah.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Profil'),
              onTap: () {
                // Kembali ke halaman sebelumnya dalam stack navigator
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Penjumlahan'),
              onTap: () {
                // Navigasi ke halaman penjumlahan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PenjumlahanPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Ganjil & Genap'),
              onTap: () {
                // Navigasi ke halaman ganjil & genap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GanjilGenapPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Lakukan logout
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          _buildPersonInfo(
            'assets/images/nino.jpg',
            'IBNU TAUFICK AHRAZA',
            'NIM: 123210192',
          ),
          const SizedBox(height: 20),
          _buildPersonInfo(
            'assets/images/ibnu.jpg',
            'ZIDANE DENINO PUTRA PRAYITNO',
            'NIM: 123210104',
          ),
        ],
      ),
    );
  }

  Widget _buildPersonInfo(String imagePath, String name, String nim) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 20),
        Center(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Center(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              nim,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PenjumlahanPage extends StatefulWidget {
  const PenjumlahanPage({Key? key}) : super(key: key);

  @override
  _PenjumlahanPageState createState() => _PenjumlahanPageState();
}

class _PenjumlahanPageState extends State<PenjumlahanPage> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjumlahan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number 1'),
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number 2'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                int number1 = int.tryParse(number1Controller.text) ?? 0;
                int number2 = int.tryParse(number2Controller.text) ?? 0;
                setState(() {
                  result = (number1 + number2).toString();
                });
              },
              child: const Text('Jumlahkan'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Hasil: $result',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GanjilGenapPage extends StatefulWidget {
  const GanjilGenapPage({Key? key}) : super(key: key);

  @override
  _GanjilGenapPageState createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganjil & Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan Angka'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                int number = int.tryParse(numberController.text) ?? 0;
                setState(() {
                  result = (number % 2 == 0) ? 'Angka Genap' : 'Angka Ganjil';
                });
              },
              child: const Text('Cek'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Hasil: $result',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
