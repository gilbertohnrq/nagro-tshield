# version: 3.7.5+147

* Migração das constantes de size do projeto;
* Identificação do modo de bateria em modo de economia e aviso ao usuário;
* Pull-to-refresh em telas (pre aprovado, commodities);
* Salvamento do CPF do user na tela de login, após a primeira autenticação;
* Trazer um feedback para o user que esta inativado em nossa base;
* Feedback de inativação de conta no autologin;
* Ajustar de interface em commodities;
* Ajustar de interface na home;

## version: 3.7.4+146

* Nova tela de “Bem-vindo” após splash screen;
* Substituir tela de login por bottom sheet;
* Chamar o validador de biometria ao clicar no botão;
* Ajustar o fluxo de validação do Token para incluir a opção de Whatsapp já no início;
* Aplicar requisito de segurança numérica na criação e redefinição de senha;
* Ajustar interface de commodities seguindo a nova identidade do App;
* Ajustar a home para quando o usuário rolar a tela;

## version: 3.7.3+143

* Implementação dos débitos técnicos de performance
* Ajustes de commodities no carregamento do bottom sheet;
* Ajustes de layout na tela de detalhes do contrato;
* Atualização para o flutter 3.27.3;
* Retorno no parametro FINE no manifest;

## version: 3.7.2+142

* Adoção da taxa de cadastro no fluxo de pre aprovado;
* Ajustes de commodities;
* Ajustes de layout na tela de detalhes do contrato;
* Ajustes no texto de feedback na pagina de consorcio;
* Envio dos dados de restrição de crédito e produtor rural para o back;

## version: 3.7.1+129

* Pagina de consorcio;
* Service de animações;
* Ajustes de overflows;
* Ajuste para video em android 10;
* Aumento da cobertura de testes;
* Ajuste na mascara de selfie;
* Ajuste no erro Generico da autenticação;

## version: 3.7.0+128

* Pacote de melhorias de usabilidade;
* Serviço de Banner na home;
* videos no fluxo de pre aprovado;
* Fix dos videos no android 10;

## version: 3.6.1+125

* Fix no erro da splash screen/ localization
* Ajustes de layout

## version: 3.6.0+120

* Refatoração da tela de home
* Inclusão dos fluxos de suporte no modulo de boletos e pre aprovado
* Inclusão da tela de apresentação do crédito produtor
* Inclusão da funcionalidade de redução de valor no pre aprovado
* Retirada do campo de orgão expeditor no fluxo de pre aprovado
* Modificação dos seletores para CNH e Sou um produtor

## version:3.5.4+114

* Adicionando o fluxo de Tracker de eventos

## version:3.5.3+113

* Fix no fluxo de pre aprovado adicionando validação na tela de email

## version:3.5.2+112

* Fix no push da pagina de pdf no fluxo de boletos

## version:3.5.1+111

* Ajustes necessários com a atualização de API do Gradle para 34
* Refactor do comportamento de commodities
* Testes na camada de presenter do modulo de profile
* Ajustes e melhorias no fluxo de boletos
* Implementação e melhorias no controle do funil de vendas
* Aumento na cobertura de testes unitários
* Ajustes na aplicação para MacOs sequoia
* Deixando a primeira tela de pedir crédito scroll, melhorando a visualização do imput
* Ajuste do Regex na pagina de credito
* Adição do fluxo de redefinição de senha no fluxo de criação

## version:3.5.0+102

* Refactor de todo o gerenciamento de estado adotando o BLOC Pattern
* Fix de todos os TODOs legados que a aplicação tinha
* Implementação do serviço de performance, logando no grafana o tempo de resposta de cada requisição
* Refactor tornando todas as imagens png ou jpeg em svgs (melhora na performance de carregamento e redimensionamento)
* Organização e reavalização dos packages utilizados na aplicação
* Ajustes de layout dos cards da home
* Integração de boletos com o ambiente de dev

## version:3.4.4+95

* Adição do cad_amount nos detales do contrato
* Adição do approved_amount no fluxo de credito

## version:3.4.3+94

* Adição do cad_amount ao fluxo de credito do usuário

## version:3.4.2+92

* Fix no numero do simulate presente na store para d+30

## version:3.4.1+91

* Fix na data estatica em simulate do modulo de pre aprovado

## version:3.4.0+90

* Refactor das tratativas de erro do app (todos os módulos)
* Refactor de gerenciamento de estado BankSlip
* Melhorias no fluxo do track de eventos
* Melhorias no Lcov
* Novo response em commodities
* Implementação de mascara para numeros no fluxo de pre aprovado endereço
* Pagina de aviso em caso de fraudes
* Mudança nos prazos de carencia pre aproavdo para d+30

## version:3.3.5+88

* Ajuste de layout nos cards da home
* Ajuste nas chamadas recursivas do refresh token
* Pipe line com fastlane integrando Cicd apple
* Melhorias de log com o Grafana
* Rollback de debitos técnicos (TODOs)
* Utilização do passive face liveness(BFF)

## version:3.3.4+87

* Hotfix no fluxo de refresh do token

## version:3.3.3+86(evolução se deu por problema de versão nas plataformas)

* Ajuste do fluxo de pre aprovado aceitando RG como identificação
* Integração com serviço de deeplink
* Integração com serviço de cloudfire store
* Remoção do feature flag de commidities
* Refactor nos testes unitários
* Aumento da cobertura de testes
* Melhoras nas tratativas de erros
* Ajustes em todas validações de forms
* Fluxo de retentativas do pre aprovado

## version:3.3.1+83

* Implementação do fluxo de boletos
* Refactor dos diretórios e comuns da aplicação
* Implementação do relatório de cobertura de testes
* Aumento da cobertura de testes da aplicação
* Refatoração no fluxo de pre aprovado

## version:3.2.2+82

* Fix no fluxo de login com tratativa para login automatico
* Fix no fluxo de opt do pre aprovado colocando tratativa em caso de erro
* Remoção do observer no fluxo de register em acess control
* Fix no text do pre aprovado informando prazo de 20 parcelas

## version:3.2.1+81

* Fix no envio do estado abreviado para Pre Aprovado
* Mudanca no range de parcelas na simulacao do pre aprovado

## version:3.2.0+80

* Fix no FCM token
* Implementação do otp com whatsapp para funcionalidade de reset de senha
* Fix na tela de endereço do pre aprovado, numero com o tipe number

## version:3.1.0+79

* Fix na assinatura pela foto da CNH
* Enviando taxId para checkOtp
* Salvando taxId localmente ao registrar
* Add opcao de enviar codigo otp no whatsapp
* Corrigindo o reenvio de otp para resetar senha

## version:3.0.0+78

* fix na visualização de documentos

## version:3.0.0+76

* Novo desing do App
* Add parte do fluxo de pre aprovado
* No fluxo de cadastro: validação se o user com aquele cpf já existe
* Esqueci senha: gora tem uma verificação de qual método de OTP foi usado no cadastro pra exibir as opções (email/sms)
* Login: validação de usuários inativos

## version: 2.5.0+72

* Adicao do novo fluxo de suporte

## version: 2.4.0+67

* Fix no fluxo de refreshId mobile
* Fix no fluxo de otp
* Enriquecimento com traceId no header
* Fluxo de Log para captura local
* Ajustes/melhorias de layout
* Extração das strings hard coded
* serviço de store unificado com keychain
* Fix na commodity de algodão

## version: 2.3.1+66

* Fix no funcionalidade de getDeviceInfo

## version: 2.3.0+65

* Retirada dos packages:
dart_ipify
retrofit
retrofit_generetor
json_generator
freezed
get

* Atualização da mascara no fluxo de selfie
