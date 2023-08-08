import 'package:fluster/providers/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluster/models/text.dart' as m_text;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/custom_text_field.dart';

class IsarExampleScreen extends StatelessWidget {
  IsarExampleScreen({super.key});

  final _controllerAdd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextProvider textProvider = context.watch();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: textProvider.currentTexts.length,
            itemBuilder: (context, index) {
              m_text.Text current = textProvider.currentTexts[index];
              return ListTile(
                title: Text(current.text.toString()),
                trailing: IconButton(
                    onPressed: () {
                      textProvider.removeText(current);
                    },
                    icon: const Icon(Icons.delete)),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _controllerAdd,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    textProvider
                        .addText(m_text.Text()..text = _controllerAdd.text);
                  },
                  child: Text(AppLocalizations.of(context)!.addButton))
            ],
          ),
        )
      ],
    );
  }
}
