import 'package:flutter/material.dart';
import 'package:untitled18practice/models/agent_model.dart';
import 'package:untitled18practice/models/universal_model.dart';
import 'package:untitled18practice/network/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiProvider().getHeroes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final UniversalModel agents = snapshot.data!;
            return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final Agent agent = agents.data[index];
                  return Container(
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.network(
                          agent.displayIcon,
                          fit: BoxFit.scaleDown,
                        )),
                        Text(agent.displayName),
                        Text(agent.developerName),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: List.generate(
                                agent.backgroundGradientColors.length,
                                (index) => convertToColor(
                                    agent.backgroundGradientColors[index])))),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: Text('Error'));
        },
      ),
    );
  }

  Color convertToColor(String colorCode) {
    return Color(int.parse(colorCode, radix: 16));
  }
}
