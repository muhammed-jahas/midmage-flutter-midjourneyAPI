import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_midjourney_app/features/prompt/bloc/prompt_bloc.dart';
import 'package:flutter_midjourney_app/resources/app_colors.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {
  TextEditingController controller = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();

  @override
  void initState() {
    super.initState();
    promptBloc.add(PromptInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Midner',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        actions: [
          Image.asset('assets/images/midener-logo.png',height: 30,),
          SizedBox(width: 20,)
        ],
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
          bloc: promptBloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case PromptGeneratingImageLoadState:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case PromptGeneratingImageErrorState:
                return Center(
                  child: Text('Something Went Wrong'),
                );

              case PromptGeneratingImageSuccesState:
                final successState = state as PromptGeneratingImageSuccesState;
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/background-1.png'),fit: BoxFit.cover)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.borderColor,
                                    width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      
                                        image:
                                            MemoryImage(successState.uint8list),
                                        fit: BoxFit.cover))),
                          )),
                      Container(
                        height: 220,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Generate Your AI Image 🚀 ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: controller,
                              cursorColor: Colors.grey.shade100,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                              decoration: InputDecoration(
                                
                                hintText: 'Enter your prompt',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600
                                ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey.shade200),
                                      borderRadius: BorderRadius.circular(8)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 48,
                              width: double.maxFinite,
                              child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    elevation: MaterialStatePropertyAll(0),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.primaryColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Adjust the radius as needed
                                      ),
                                      
                                    ),
                                  ),
                                  onPressed: () {
                                    if (controller.text.isNotEmpty) {
                                      promptBloc.add(PromptEnteredEvent(
                                          prompt: controller.text));
                                    }
                                  },

                                  icon: Icon(
                                     
                                    Icons.upcoming_outlined,
                                    color: AppColors.whiteColor,
                                  ),
                                  label: Text(
                                    'Generate',
                                    style:
                                        TextStyle(color: AppColors.whiteColor),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              default:
                return SizedBox();
            }
          }),
    );
  }
}
