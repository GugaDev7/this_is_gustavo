/// Modelo de dados que representa as informações do formulário de contato.
/// Segue o padrão de dados imutáveis para garantir a integridade dos dados.
class ContactModel {
  /// Nome completo do remetente
  String name = '';

  /// Email do remetente
  String email = '';

  /// Assunto da mensagem
  String subject = '';

  /// Conteúdo da mensagem
  String message = '';
}
