import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/features/ai/bloc/ai_bloc.dart';
import 'package:notetakingapp/features/ai/bloc/ai_event.dart';
import 'package:notetakingapp/features/ai/bloc/ai_state.dart';

@RoutePage()
class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController _questionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final AiBloc _aiBloc;

  @override
  void initState() {
    super.initState();
    _aiBloc = sl.get<AiBloc>();
  }

  @override
  void dispose() {
    _questionController.dispose();
    _scrollController.dispose();
    _aiBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Assistant'.localized),
        elevation: 0,
        leading: IconButton(
          onPressed: () => _showExitConfirmationDialog(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider.value(
        value: _aiBloc,
        child: BlocConsumer<AiBloc, AiState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              responseReceived: (response, chatHistory) {
                // Scroll to bottom when response is received
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_scrollController.hasClients) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                });
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                // Chat Area - Full screen
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey.shade50,
                    child: state.when(
                      initial: _buildInitialState,
                      loading: _buildLoadingState,
                      responseReceived: _buildResponseState,
                      error: _buildErrorState,
                    ),
                  ),
                ),

                // Input Area
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: TextField(
                              controller: _questionController,
                              decoration: InputDecoration(
                                hintText: 'Type your message...'.localized,
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                              maxLines: 4,
                              minLines: 1,
                              textInputAction: TextInputAction.newline,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: IconButton(
                            onPressed: state.maybeWhen(
                              loading: () => null,
                              orElse: () => _askQuestion,
                            ),
                            icon: state.maybeWhen(
                              loading: () => const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                              orElse: () => const Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            constraints: const BoxConstraints(
                              minWidth: 48,
                              minHeight: 48,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.psychology,
            size: 80,
            color: Colors.purple.shade300,
          ),
          const SizedBox(height: 24),
          Text(
            'Ask anything about your notes.'.localized,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple.shade700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Your AI assistant will analyze all your notes\nand answer your questions.'
                .localized,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
          ),
          const SizedBox(height: 16),
          Text(
            'Analyzing your notes...'.localized,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponseState(
    String response,
    List<Map<String, String>> chatHistory,
  ) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // All chat history (including last message)
          ...chatHistory.map(_buildChatMessage),
        ],
      ),
    );
  }

  Widget _buildChatMessage(Map<String, String> message) {
    final isUser = message['role'] == 'user';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            // AI Avatar
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.psychology,
                color: Colors.purple.shade700,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
          ],

          // Message content
          Expanded(
            child: Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isUser) ...[
                  Text(
                    'AI Assistant'.localized,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.purple.shade600 : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isUser
                          ? Colors.purple.shade600
                          : Colors.grey.shade200,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    message['content']!,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: isUser ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (isUser) ...[
            const SizedBox(width: 12),
            // User Avatar
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.shade600,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            message.localized,
            style: TextStyle(
              fontSize: 16,
              color: Colors.red.shade600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.read<AiBloc>().add(const AiEvent.clearResponse());
            },
            icon: const Icon(Icons.refresh),
            label: Text('Try Again'.localized),
          ),
        ],
      ),
    );
  }

  void _askQuestion() {
    final question = _questionController.text.trim();
    if (question.isEmpty) return;

    _aiBloc.add(AiEvent.askQuestion(question: question));
    _questionController.clear();
  }

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Chat History'.localized),
        content: Text(
          'Your chat history will be lost. Are you sure you want to exit?'
              .localized,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'.localized),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Exit from AI Assistant screen
            },
            child: Text('Exit'.localized),
          ),
        ],
      ),
    );
  }
}
