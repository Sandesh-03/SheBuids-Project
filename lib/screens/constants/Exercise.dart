import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shebuilds/constants.dart';

import '../../demo/ExcersiseStruct.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  List<Exercise> exercise = [
    Exercise(
        dec:
            'Step 1:  Lie on your stomach with your legs straight and feet together, and place your hands under your shoulders\nStep 2:  Using your hands to push you, lift your head and shoulders and breathe deeply\nTip:\n in (inhale), allowing the belly to expand as you inhale. When you breathe out (exhale), the belly moves in and softens',
        t: 'COBRA pose yoga',
        Imageurl: 'assets/cobra1.gif'),
    Exercise(
        dec:
            'Step 1: Keep your hands shoulder – width apart and your knees directly below your hips.\nStep 2: Inhale deeply while curving your lower back and bringing your head up like a cow\nStep 3: exhale deeply and bring your stomach in arching your spine and bringing your head and pelvis down like a cat ',
        t: 'CAT/ COW pose yoga',
        Imageurl: 'assets/cat_pose1.gif'),
    Exercise(
        dec:
            'Step 1: kneel and sit on your knees. Lean forward, keeping your seat on your heels, and rest your forehead on the floor \nStep 2: Move your arms so they are next to your legs palms facing up.\nStep 3: Inhale and exhale, slowly and deeply, for at least 40 seconds ',
        Imageurl: 'assets/child.gif',
        t: 'ADAPTED CHILD pose yoga'),
    Exercise(
        dec:
            'Step 1: Lie on your back with your arms in a T-shape Move your hips a little over the right and bring your knees over to the left.\nStep 2: Support your knees with a bolster or blocks hold the pose for 40 second or till you feel comfortable\nStep 3: To come out of the pose, bring your knees over your hips and repeat on the other side.',
        Imageurl: 'assets/twist.gif',
        t: 'RECLINING TWIST yoga'),
    Exercise(
        dec:
            'Step 1: Bend your knees and bring the soles of your feet together as youlet your knees fall out to either side \nStep 2: Press the outer edges of your feet together strongly. The feet may begin to open like a book. You can encourage this with your hands or hold onto your big toes.',
        Imageurl: 'assets/cobbler\'s.gif',
        t: 'COBBLER’S pose'),
    Exercise(
        dec:
            'Step 1: Extend your right leg and place the bottom of your left foot on your right inner thigh.\nStep 2: Center your torso over the right leg and fold forward\nStep 3: Come back through the Cobbler\'s Pose to set up for the other side.',
        Imageurl: 'assets/headtokness.gif',
        t: 'Head to knee pose'),
    Exercise(
        dec:
            'Step 1: Bring both legs outstretched for a forward bend.\nStep 2: Lengthen the spine in a seated position before coming forward.\nImagine the pelvis as a bowl that is tipping forward as you come down.',
        Imageurl: '',
        t: 'TOP TAPS'),
    Exercise(
        dec:
            'Step 1: lie down on your back \nStep 2: Press into your feet to lift the hips slightly and slide a yoga block  under them to support\nStep 3: To come out, press into the feet to lift the hips again and slide the block out',
        Imageurl: 'assets/supportedbridge.gif',
        t: 'Supported Bridge Pose'),
    Exercise(
        dec:
            'Step 1: lie flat on your back on the yoga mat. bring your forearms to your sides. Lift the upper body off the ground\nStep 2: Rest your wright on your hips and forearms. Keep the lower body on the ground\nStep 3: gently release the pose',
        Imageurl: 'assets/fishpose.gif',
        t: 'FISH pose'),
    Exercise(
        dec:
            'Step 1: Bring your arms alongside your body, but slightly separated from your torso. Tuck your shoulder blades onto your back for support.\nStep 2: Once you have set up your limbs, release any effort from holding them in position. Once you have set up your limbs, release any effort from holding them in position',
        Imageurl: 'assets/corpse.gif',
        t: 'CORPSE pose yoga'),
  ];

  int ExeNo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Exercise',
            style: kHedTextStyle,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .30,
                  height: 40,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        exercise[ExeNo].title,
                        style: kHedTextStyle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image(
                    image: AssetImage(exercise[ExeNo].imageurl),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text(
                    exercise[ExeNo].description,
                    style: kDescTextStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(30),
                        // color: Colors.blue,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 4,
                          onPressed: () {
                            setState(() {
                              if (ExeNo < exercise.length - 1) {
                                ExeNo++;
                              } else {}
                            });
                          },
                          child: const Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
