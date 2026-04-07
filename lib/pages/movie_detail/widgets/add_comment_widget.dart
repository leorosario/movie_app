import 'package:flutter/material.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({super.key});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  final formKey = GlobalKey<FormState>();
  final commentNode = FocusNode();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Card(
          child: Container(
            color: Colors.black45,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      focusNode: commentNode,
                      controller: commentController,
                      textCapitalization: TextCapitalization.sentences,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (v) {
                        if(v == null || v.isEmpty){
                          return 'Não pode ser vazio';
                        }

                        if (v.length < 3){
                          return "O mínimo de caracteres é 3";
                        }

                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Adicione um comentário...',
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onSubmitted,
                  child: const Text('Enviar')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSubmitted(){
    if (!formKey.currentState!.validate()) return;
    print('submit');
    // TODO: Enviar para API
    // commentNode.unfocus();
    // formKey.currentState!.reset();
  }
}
