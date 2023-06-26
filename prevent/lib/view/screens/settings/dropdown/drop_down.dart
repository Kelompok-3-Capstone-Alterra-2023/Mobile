import 'package:flutter/material.dart';
import 'package:prevent/util/theme.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/settings_view_model.dart';
import 'expanded_section.dart';
import 'my_scrollbar.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsViewModel>(context, listen: true);
    // provider.title = AppLocalizations.of(context)!.dropDownFirst;
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    provider.isStrechedDropDownTrue();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: colorStyleFifth),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: colorStyleFifth,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          constraints: const BoxConstraints(
                            minHeight: 45,
                            minWidth: double.infinity,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Consumer<SettingsViewModel>(
                                    builder: (context, value, child) {
                                      return Text(
                                        provider.title,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Consumer<SettingsViewModel>(
                                builder: (context, value, _) {
                                  return Icon(provider.isStrechedDropDown
                                      ? Icons.keyboard_arrow_down_rounded
                                      : Icons.keyboard_arrow_up_rounded);
                                },
                              )
                            ],
                          ),
                        ),
                        Consumer<SettingsViewModel>(
                          builder: (context, value, _) {
                            return ExpandedSection(
                              expand: provider.isStrechedDropDown,
                              height: 100,
                              child: MyScrollbar(
                                builder: (context, scrollController2) =>
                                    ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  controller: scrollController2,
                                  shrinkWrap: true,
                                  itemCount: provider.list.length,
                                  itemBuilder: (context, index) {
                                    return RadioListTile(
                                      title:
                                          Text(provider.list.elementAt(index)),
                                      value: index,
                                      groupValue: provider.groupValue,
                                      onChanged: (val) {
                                        provider.groupValue = val!;
                                        provider.title =
                                            provider.list.elementAt(index);
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
