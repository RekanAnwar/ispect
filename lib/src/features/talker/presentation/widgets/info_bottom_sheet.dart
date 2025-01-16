import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ispect/ispect.dart';
import 'package:ispect/src/common/extensions/context.dart';
import 'package:ispect/src/common/widgets/widget/base_bottom_sheet.dart';

class ISpectLogsInfoBottomSheet extends StatelessWidget {
  const ISpectLogsInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final iSpect = ISpect.read(context);
    return BaseBottomSheet(
      title: 'Logs info',
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: 16, top: 8),
          child: CustomScrollView(
            primary: false,
            slivers: [
              SliverToBoxAdapter(
                child: _InfoDescriptionPlaceholder(
                  iSpect: iSpect,
                ),
              ),
              // BlocBuilder<LogDescriptionsCubit, LogDescriptionsState>(
              //   builder: (context, state) {
              //     if (state is LogDescriptionsLoading) {
              //       return const SliverToBoxAdapter(
              //         child: Padding(
              //           padding: EdgeInsets.only(top: 64),
              //           child: AiLoaderWidget(),
              //         ),
              //       );
              //     } else if (state is LogDescriptionsLoaded) {
              //       return SliverToBoxAdapter(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text.rich(
              //               TextSpan(
              //                 children: [
              //                   TextSpan(
              //                     text: '${context.ispectL10n.testerLogDesc}:',
              //                     children: [
              //                       TextSpan(
              //                         text: ' error,',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'error',
              //                           ),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' critical,',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'critical',
              //                           ),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' exception,',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'exception',
              //                           ),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' info,',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'info',
              //                           ),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' print,',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'print',
              //                           ),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' route,',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'route',
              //                           ),
              //                         ),
              //                       ),
              //                       TextSpan(
              //                         text: ' ${context.ispectL10n.talkerTypeHttp}.',
              //                         style: TextStyle(
              //                           color: iSpect.theme.getTypeColor(
              //                             context,
              //                             key: 'http-request',
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   TextSpan(
              //                     text: '\n${context.ispectL10n.otherLogsForDevelopers}.',
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             const Gap(16),
              //             ...state.logDescriptions.map(
              //               (log) => _LogKey(
              //                 log.key,
              //                 log.description,
              //                 log.key,
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     } else if (state is LogDescriptionsError) {
              //       return SliverToBoxAdapter(
              //         child: _InfoDescriptionPlaceholder(
              //           iSpect: iSpect,
              //         ),
              //       );
              //     }
              //     return const SizedBox.shrink();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoDescriptionPlaceholder extends StatelessWidget {
  const _InfoDescriptionPlaceholder({
    required this.iSpect,
  });

  final ISpectScopeModel iSpect;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Tester logs description:',
                  children: [
                    TextSpan(
                      text: ' error,',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'error',
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' critical,',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'critical',
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' exception,',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'exception',
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' info,',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'info',
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' print,',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'print',
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' route,',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'route',
                        ),
                      ),
                    ),
                    TextSpan(
                      text: ' HTTP requests.',
                      style: TextStyle(
                        color: iSpect.theme.getTypeColor(
                          context,
                          key: 'http-request',
                        ),
                      ),
                    ),
                  ],
                ),
                const TextSpan(
                  text: '\nOther logs are already being used by developers.',
                ),
              ],
            ),
          ),
          const Gap(16),
          Text(
            'Common',
            style: TextStyle(
              color: context.ispectTheme.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(8),
          ...[
            const _LogKey(
              '1. error',
              'Error log',
              'error',
            ),
            const _LogKey(
              '2. critical',
              'Critical error log',
              'critical',
            ),
            const _LogKey(
              '3. info',
              'Informational message log',
              'info',
            ),
            const _LogKey(
              '4. debug',
              'Debug log',
              'debug',
            ),
            const _LogKey(
              '5. verbose',
              'Verbose log',
              'verbose',
            ),
            const _LogKey(
              '6. warning',
              'Warning log',
              'warning',
            ),
            const _LogKey(
              '7. exception',
              'Exception log',
              'exception',
            ),
            const _LogKey(
              '8. good',
              'Success log',
              'good',
            ),
            const _LogKey(
              '9. route',
              'Navigation route log',
              'route',
            ),
            const _LogKey(
              '10. print',
              'Print log',
              'print',
            ),
            const _LogKey(
              '11. analytics',
              'Analytics log',
              'analytics',
            ),
          ],
          const Gap(16),
          Text(
            'HTTP',
            style: TextStyle(
              color: context.ispectTheme.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(8),
          ...[
            const _LogKey(
              '1. http-request',
              'HTTP request log',
              'http-request',
            ),
            const _LogKey(
              '2. http-response',
              'HTTP response log',
              'http-response',
            ),
            const _LogKey(
              '3. http-error',
              'HTTP error log',
              'http-error',
            ),
          ],
          const Gap(16),
          Text(
            'Bloc',
            style: TextStyle(
              color: context.ispectTheme.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(8),
          ...[
            const _LogKey(
              '1. bloc-event',
              'Bloc event log',
              'bloc-event',
            ),
            const _LogKey(
              '2. bloc-transition',
              'Bloc state transition log',
              'bloc-transition',
            ),
            const _LogKey(
              '3. bloc-close',
              'Bloc close log',
              'bloc-close',
            ),
            const _LogKey(
              '4. bloc-create',
              'Bloc create log',
              'bloc-create',
            ),
          ],
          const Gap(16),
          Text(
            'Riverpod',
            style: TextStyle(
              color: context.ispectTheme.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(8),
          ...[
            const _LogKey(
              '1. riverpod-add',
              'Riverpod add log',
              'riverpod-add',
            ),
            const _LogKey(
              '2. riverpod-update',
              'Riverpod update log',
              'riverpod-update',
            ),
            const _LogKey(
              '3. riverpod-dispose',
              'Riverpod dispose log',
              'riverpod-dispose',
            ),
            const _LogKey(
              '4. riverpod-fail',
              'Riverpod fail log',
              'riverpod-fail',
            ),
          ],
        ],
      );
}

class _LogKey extends StatelessWidget {
  const _LogKey(
    this.title,
    this.description,
    this.logKey,
  );
  final String title;
  final String description;
  final String logKey;

  @override
  Widget build(BuildContext context) {
    final iSpect = ISpect.read(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: iSpect.theme.getTypeColor(
                    context,
                    key: logKey,
                  ),
                ),
              ),
              TextSpan(
                text: ' - $description',
                style: TextStyle(color: context.ispectTheme.textColor),
              ),
            ],
          ),
        ),
        const Gap(8),
      ],
    );
  }
}
