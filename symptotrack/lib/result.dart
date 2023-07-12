import 'dart:io';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:symptotrack/home.dart';

class Result extends StatefulWidget {
  final String pred;

  File imageFile;

  Result(this.pred, this.imageFile);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Text(
                    'You are -',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.pred,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              background: Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(
                    widget.imageFile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            backgroundColor:
                widget.pred == 'Parasitized' ? Colors.red : Colors.green,
            floating: true,
            pinned: true,
            snap: true,
            // Add more customization as needed
          ),
          SliverToBoxAdapter(
              child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                widget.pred == 'Parasitized'
                    ? Text(
                        'Please take care of yourself',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          //decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      )
                    : Text(
                        "That's good, keep it up!!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          //decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                widget.pred == 'Parasitized'
                    ? SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '''It's important to consult a healthcare professional for accurate diagnosis and personalized treatment options. In most cases, malaria is treated with antimalarial medications prescribed by a doctor. The specific medication and duration of treatment depend on factors such as the type and severity of malaria, the patient's age, medical history, and geographic location.''',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Text(
                                '''In addition to medication, other supportive measures may include:

\n\t1. Rest: Get plenty of rest to allow your body to recover.

\n\t2. Fluids: Drink plenty of fluids to stay hydrated and prevent dehydration.

\n\t3. Symptom management: Medications like acetaminophen may be recommended to manage fever and pain associated with malaria.

\n\t4. Prevention of mosquito bites: To prevent further malaria infections, it is important to take precautions to avoid mosquito bites, such as using insect repellent, wearing protective clothing, and sleeping under mosquito nets.

\n\nIt's crucial to follow the advice and treatment plan prescribed by a healthcare professional. Malaria can have severe complications, so early diagnosis and proper treatment are vital for a patient's recovery.''',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            '''To protect yourself from malaria, you can take several precautions. Here are some essential precautions to consider:

\n\t1.Use Bed Nets: Sleep under an insecticide-treated bed net to prevent mosquito bites, especially at night when mosquitoes are most active.

\n\t2.Apply Insect Repellent: Use mosquito repellents containing DEET, picaridin, or other recommended ingredients on exposed skin and clothing to repel mosquitoes.

\n\t3.Wear Protective Clothing: Cover your body with long-sleeved shirts, long pants, socks, and closed-toe shoes to minimize exposure to mosquito bites.

\n\t4.Stay in Screened Areas: Stay in accommodations with proper window screens, doors, or air conditioning to keep mosquitoes outside.

\n\t5.Avoid Peak Mosquito Activity: Minimize outdoor activities during dusk and dawn when mosquitoes are most active.

\n\t6.Eliminate Mosquito Breeding Sites: Remove stagnant water sources, such as uncovered containers, flower pots, and other objects that can collect water, as they serve as breeding grounds for mosquitoes.

\n\t7.Take Antimalarial Medication: If you are traveling to an area with a high risk of malaria transmission, consult a healthcare professional to discuss appropriate antimalarial medication options and take them as prescribed.

\n\t8.Stay Informed: Stay informed about the malaria risk in your area of travel and follow any additional recommendations or guidelines provided by health authorities.

\n\nIt's important to note that these precautions may vary based on the malaria risk level in specific regions and the recommendations of local health authorities. Therefore, it is advisable to consult with healthcare professionals or travel health clinics for personalized advice based on your destination and individual circumstances.

\nRemember that no preventive measure is 100% effective, so it's essential to stay vigilant and seek medical attention if you experience any malaria symptoms, such as fever, headache, muscle aches, and fatigue, especially after potential exposure to mosquitoes in high-risk areas.''',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    // onPressed: () async {
                    //   widget.imageFile = await pickImage();
                    //   setState(() {
                    //     _futureAlbum = createAlbum(imageFile);
                    //   });
                    // },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Theme.of(context).canvasColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                    ),
                    child: Text(
                      "Check again",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).canvasColor),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
