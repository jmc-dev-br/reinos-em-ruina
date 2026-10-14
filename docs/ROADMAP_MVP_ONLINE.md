# Reinos em Ruína — Roadmap do MVP Online

Este documento transforma a direção do projeto em etapas entregáveis. O nome **Reinos em Ruína** e o capítulo inicial **A Moeda Partida** permanecem. A visão principal é um RPG medieval de exploração e comércio em que decisões econômicas alteram o reino; combate tático, atividades de ausência e sistemas comunitários serão incorporados por fases.

## Direção de produto

- **Mundo:** fantasia medieval em recuperação, com regiões, ruínas, rotas comerciais e uma vila que muda conforme suas decisões.
- **Loop do jogador:** explorar → investigar → combate tático → receber recursos → melhorar equipamentos → decidir a política do reino → desbloquear novas regiões.
- **Identidade:** educação financeira embutida na história; juros, orçamento, dívida, inflação, fraude e investimento aparecem como consequências, não como perguntas de prova.
- **Combate:** cartas por turnos com 3 pontos de energia por turno. O jogador escolhe ataque, defesa e cura; estratégia e preparação devem valer mais que reflexos rápidos.
- **Economia:** cobre é moeda fictícia. Nenhuma monetização pode vender poder de combate ou prometer retorno financeiro.
- **Referência visual:** mapas top-down em blocos e construções legíveis, combinados a uma interface escura, limpa e responsiva.

## Fase 1 — MVP jogável no navegador

### Já presente no protótipo
- Mapa top-down de Brumaforte e entrada para as ruínas em visão lateral.
- Criador de personagem e opções de aparência.
- Capítulo da Moeda Partida, personagens, criaturas, missões e escolhas econômicas.
- Vida, nível, XP, cobre fictício, poções, loja, caderno financeiro e salvamento local.
- Combate tático experimental com quatro cartas: Golpe Preciso, Estocada Pesada, Guarda de Pedra e Poção de Ervas.
- Atividades locais de ausência: Treinar Força (+12 XP/h) ou Trabalhar na Taverna (+5 cobres/h), com limite de 8 horas por ciclo. A simulação depende do relógio e do armazenamento do navegador e não é resistente a trapaças.
- Menu de controles e configurações.

### Critérios para concluir o MVP local
1. Testar todos os botões em desktop e celular.
2. Confirmar colisões, animações, saltos, combate, evolução, salvamento e carregamento.
3. Garantir que o combate tático nunca duplique recompensa ao recarregar ou apertar botões rapidamente.
4. Completar ao menos cinco pontos de exploração com NPC, risco, recompensa ou decisão em cada ponto.
5. Garantir acessibilidade básica: foco visível, contraste, textos legíveis e controles explicados.

## Fase 2 — Base online segura

O site atual é um protótipo estático. Para login real, progresso compartilhado e economia persistente, adicionar um servidor e banco de dados. Não confiar no navegador para declarar recompensas, saldo, inventário ou vitória em combate.

- **Frontend:** manter a experiência web e separar componentes de mapa, personagem, cartas, inventário e diário.
- **Backend:** API Node.js/TypeScript ou Python, com autenticação por sessão segura, validação de comandos no servidor e limites de requisição.
- **Banco:** PostgreSQL para usuários, personagens, inventário, missões, transações, guildas e estado global; transações do banco para evitar saldo duplicado.
- **Tempo real:** WebSocket/Socket.IO apenas quando houver necessidade real de eventos e atualização ao vivo.
- **Segurança:** validar toda ação no servidor, usar transações idempotentes, registrar histórico econômico, impedir duplicação de recompensas e nunca confiar em preços, XP ou dano enviados pelo cliente.

### Entidades iniciais sugeridas
users, characters, items, character_inventory, quests, combat_sessions, combat_actions, economy_transactions, offline_activities, guilds, guild_members, guild_buildings, world_objectives.

## Fase 3 — Progressão e comunidade

1. **Inventário e criação de itens:** materiais com fontes, custos e receitas visíveis.
2. **Atividade de ausência validada no servidor:** escolher treino ou trabalho; o servidor calcula tempo elegível, com limite diário e registro auditável.
3. **Mercado entre jogadores:** anúncios e trocas atômicas no servidor, histórico de preços e confirmação antes da troca.
4. **Guildas como locais físicos:** sede compartilhada, doações, biblioteca e ferreiro com benefícios moderados.
5. **Objetivo mundial:** um portão comunitário com barra de contribuição calculada pelo servidor. O desbloqueio acontece somente quando o banco confirma a meta.
6. **PvP assíncrono opcional:** o defensor configura um baralho automático; o servidor resolve a luta e registra os resultados. Sem roubo irreversível de compras reais nem poder pago.

## Fase 4 — Conteúdo vivo e monetização ética

- Temporadas gratuitas com missões, história e recompensas.
- Passe pago apenas para cosméticos, títulos e personalização; nenhum bônus de dano, vida, XP competitivo ou chance superior de loot.
- Cosméticos para personagens, barcos, sede da guilda e molduras de perfil.
- Eventos comunitários com regras públicas, custos e resultados auditáveis.

## Decisões que devem permanecer explícitas

- **Não chamar de multiplayer o que só está no armazenamento local.** O estado atual é local por navegador.
- **Não simular sincronização global.** Metas coletivas, chat, PvP e guildas compartilhadas dependem de backend.
- **Não conectar dinheiro real ao cobre do jogo.** Valores, recompensas e decisões econômicas são fictícios.
- **Não lançar economia aberta antes de ter validação no servidor, logs e ferramentas de moderação.**

## Próxima entrega recomendada

Concluir e testar o combate tático e o movimento no cliente; em seguida, escolher provedor de backend e implementar autenticação, persistência no PostgreSQL e autoridade de combate no servidor. Só então desenvolver guildas e objetivo global.


## Atualização do protótipo local — efeitos e progressão

O cliente atual inclui clima pixelado (chuva, folhas e alternância automática), tonalidade dia/noite baseada na hora local do computador, brilho animado na água, texto flutuante de dano/cura, tremor de impacto, efeitos sonoros sintetizados e trilha procedural opcional. Esses recursos têm opções independentes no menu.

Também foram adicionados:
- **Recompensa diária:** sequência de dias por espaço de salvamento, cobre fictício crescente limitado a 26 por reivindicação e uma poção bônus a cada sétimo dia consecutivo.
- **Conquistas locais:** primeira criatura, 10 derrotas, nível 3, 100 cobres, capítulo I concluído, primeira poção fabricada e sequência de sete recompensas.
- **Profissões:** mineração, herbologia e pesca têm níveis/XP e fornecem materiais locais. Três ervas e um minério fabricam uma poção; três minérios podem ser refinados em seis cobres fictícios.
- **Efeitos e áudio são opcionais:** o jogador controla clima, luz, efeitos visuais, sons e trilha ambiente.

## Próxima fase online: eventos, leilões e masmorras cooperativas

A versão atual continua sendo um jogo estático para um jogador. Clima é apenas ambientação local, e recompensas, materiais e conquistas não sincronizam entre navegadores.

1. **Eventos globais de três em três horas:** agendamento e ID do evento no servidor, tempo de expiração, registro da contribuição de cada jogador e distribuição idempotente das recompensas.
2. **Casa de leilões:** anúncios, depósito temporário dos itens, transferência atômica de itens e cobre, taxa configurável de 5%, histórico de preços, proteção contra duplicação e moderação.
3. **Masmorras cooperativas de 3 a 5 jogadores:** grupos, funções de tanque/cura/dano, turnos autoritativos no servidor, reconexão e recompensa por contribuição.
4. **Conquistas públicas e perfis:** registrar desbloqueios no servidor após validar as ações; o localStorage deve ser somente um cache.
5. **Áudio final:** manter o áudio procedural como fallback e acrescentar trilhas e efeitos originais/licenciados quando houver um pipeline de assets.

Esses sistemas só devem ser chamados de globais/multiplayer depois de implementar autenticação, APIs confiáveis, persistência PostgreSQL, transações, logs de auditoria e proteção contra abuso.


## Vila de Brumaforte — NPCs, lojas e missões secundárias

O mapa local agora inclui Toren (ferreiro), Elira (cuidadora do jardim), Brann (pescador) e Sabela (estalajadeira), além de Mara e Ivo. Os novos moradores têm sprites/cores próprias, rótulos e interações por proximidade com **E / Enter**.

### Missões secundárias implementadas no cliente
- **Ferro para as ferramentas:** entregar 3 minérios a Toren; recompensa de 18 cobres fictícios e 28 XP.
- **Ervas para os feridos:** entregar 4 ervas a Elira; recompensa de 10 cobres, 22 XP e 1 poção.
- **A pesca do dia:** entregar 3 peixes a Brann; recompensa de 15 cobres e 20 XP.
- **Estalagem da Folha Dourada:** Sabela vende caldo que recupera até 20 pontos de vida por 4 cobres e oferece um diálogo com rumor sobre os carregamentos.

Os estados das missões secundárias são incluídos em salvamentos novos e migram de forma segura em jornadas antigas. A ferraria oferece minério, ervas e peixe para que as missões possam ser concluídas sem depender apenas da sorte da coleta. Casas, caminhos, placas e colisões básicas foram adicionados ao mapa.

Esses sistemas são locais ao navegador e ao save do jogador. Uma futura guilda com edifícios, mercado entre jogadores, eventos globais e reputação pública precisará de validação no servidor; estes novos NPCs não representam jogadores online.
