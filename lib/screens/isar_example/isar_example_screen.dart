import 'package:fluster/components/custom_text_field.dart';
import 'package:fluster/internal/database.dart';
import 'package:fluster/models/text.dart' as m_text;
import 'package:fluster/providers/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

/// This [IsarExampleScreen] is visible when opening the Isar tab
/// from the MainScaffold
///
/// It displays an [List] of [Text] Models that are saved in an [IsarDatabase]
/// [Text] Objects can be add, removed and get from the Database.
class IsarExampleScreen extends StatelessWidget {
  /// Constructor of [IsarExampleScreen]
  IsarExampleScreen({super.key});

  final _controllerAdd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textProvider = context.watch<TextProvider>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: textProvider.currentTexts.length,
            itemBuilder: (context, index) {
              final current = textProvider.currentTexts[index];
              return ListTile(
                title: Text('${current.id} ${current.text}'),
                trailing: IconButton(
                  onPressed: () {
                    textProvider.removeText(current);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _controllerAdd,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final db = await textProvider.database.db;
                  await textProvider.addText(m_text.Text(
                      db.texts.autoIncrement(), _controllerAdd.text));
                },
                child: Text(AppLocalizations.of(context)!.addButton),
              )
            ],
          ),
        )
      ],
    );
  }
}
