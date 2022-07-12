import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 20;
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;
  String vaga = 'Vagas';

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  String vagaSingularPlural() {
    if (count > 0) {
      return vaga = 'Vagas';
    } else {
      return vaga = 'Vaga';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
                isEmpty
                    ? 'assets/images/luz_vermelha.png'
                    : 'assets/images/luz_verde.png',
                scale: 2),
            const SizedBox(
              height: 50,
            ),
            Text(
              isEmpty
                  ? 'Estacionamento lotado'
                  : count == 1
                      ? 'Vaga disponível'
                      : isFull
                          ? 'Estacionamento vazio'
                          : 'Vagas Disponíveis',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                color: isEmpty ? Colors.red : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 50),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      count == 1
                          ? 'Quantidade\nde Vaga:'
                          : 'Quantidade\nde Vagas:',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      count.toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 50,
                        color: isEmpty ? Colors.red : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.4) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.4) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
