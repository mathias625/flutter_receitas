import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../theme/app_theme.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;
  final VoidCallback onTap;

  const ReceitaCard({
    super.key,
    required this.receita,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imagemUrl = receita.img.trim();

    return Card(
      color: AppTheme.card,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: AppTheme.borda),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: imagemUrl.isNotEmpty
                    ? Image.network(
                        imagemUrl,
                        width: 100,
                        height: 110,
                        fit: BoxFit.cover,
                        webHtmlElementStrategy:
                            WebHtmlElementStrategy.fallback,
                        errorBuilder: (_, __, ___) => _imagemPadrao(),
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;

                          return Container(
                            width: 100,
                            height: 110,
                            color: AppTheme.superficie,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              color: AppTheme.preto,
                              strokeWidth: 2,
                            ),
                          );
                        },
                      )
                    : _imagemPadrao(),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.superficie,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        receita.tipo.toUpperCase(),
                        style: const TextStyle(
                          color: AppTheme.preto,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      receita.nome,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.texto,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      receita.ingredientes.isEmpty
                          ? 'Confira os ingredientes'
                          : receita.ingredientes,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textoSecundario,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ver receita  →',
                      style: TextStyle(
                        color: AppTheme.preto,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagemPadrao() {
    return Container(
      width: 100,
      height: 110,
      color: AppTheme.superficie,
      alignment: Alignment.center,
      child: const Icon(
        Icons.restaurant,
        color: AppTheme.textoSecundario,
        size: 32,
      ),
    );
  }
}
