import "package:flutter/material.dart";
class AddtionalInfoItem extends StatelessWidget {

  final IconData icon;
  final String label;
  final String value;

  const AddtionalInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon,size: 35,),
              const SizedBox(
              height: 12,
            ),
            Text(label,style: TextStyle(fontSize: 16),),
            
            const SizedBox(
              height: 12,
            ),
             Text(value,style: TextStyle(fontSize: 24 , fontWeight:FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
