import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  CardButton({
    required this.nextPage,
    required this.title,
    required this.icon,
    required this.color,
  });

  final Color color;
  final Function nextPage;
  final String title; //= 'Editar Perfil';
  final IconData icon; //= ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => nextPage()),
        );
      },
      child: Card(
        color: color,
        margin: EdgeInsets.all(50),
        child: Container(
          height: 200,
          width: 200,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 48,
              ),
              SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}