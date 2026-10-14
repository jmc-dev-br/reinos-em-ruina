# Reinos em Ruína — Roadmap do MVP Online

Este documento registra as etapas do projeto **Reinos em Ruína** e do capítulo **A Moeda Partida**. A direção ativa é uma aventura de exploração em pixel art vista de cima, inspirada na leitura clara dos jogos portáteis clássicos, com criaturas originais, encontros por turnos e educação financeira integrada à história.

## Direção de produto

- **Mundo:** Brumaforte, Bosque Velado, Lago Silencioso e Mina Antiga, todos explorados em visão superior.
- **Loop do jogador:** explorar → conhecer moradores → encontrar criaturas → duelar por turnos → capturar/treinar parceiros → resolver missões e decisões econômicas → abrir novas regiões.
- **Identidade:** personagens pequenos em pixel art, NPCs reconhecíveis, criaturas originais, cenários tile-based e interface de portátil clássico.
- **Combate:** encontros por turnos com movimentos de dano fixo, cura, troca de parceiro, fuga e captura quando a criatura selvagem está enfraquecida.
- **Economia:** cobre é moeda fictícia. Juros, orçamento, dívida, inflação, fraude e investimento aparecem por meio das missões e consequências.
- **Online:** a versão atual continua single-player; trocas entre jogadores, sincronização e validação de recompensas exigem servidor.

## Fase 1 — MVP jogável no navegador

### Já presente no protótipo
- Mapas de Brumaforte, Bosque Velado, Lago Silencioso e Mina Antiga em exploração top-down.
- Criador de personagem e opções de aparência.
- Capítulo da Moeda Partida, personagens, criaturas, missões e escolhas econômicas.
- Vida, nível, XP, cobre fictício, poções, loja, caderno financeiro e salvamento local.
- Encontros por turnos com criaturas, movimentos próprios, parceiros, cura, captura e equipe de até seis criaturas.
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


## Histórico: Reboot 1.0 — implementação no cliente (mecânicas substituídas pelo Reboot 2.0)

### Regiões, mapa e chefes
- A região padrão é Brumaforte. **Bosque Velado** pode abrir a partir do nível 2 ou com a investigação avançada; **Lago Silencioso** abre a partir do nível 4 ou após concluir o capítulo I.
- O mapa do mundo mostra a descrição e o requisito de cada área.
- Lobo da Névoa e Leviatã de Vidro têm sprites próprios, barras de vida e uma segunda fase de fúria abaixo de 45% de resistência. O Guardião Oco recebe uma barra de chefe.
- O chefe da região só é revelado quando o jogador inicia a missão correspondente; rótulos não entregam o encontro antes da história.

### NPCs com aparência e personalidade
O sistema visual compartilhado usa a mesma função de sprite do protagonista, com aparência individual por personagem: gênero, roupa, capa, pele, cabelo, acessórios e arma. A animação idle e props produzem pequenas poses (martelo, cesta, vara de pesca, bandeja). Retratos e cartões de diálogo exibem personalidade e biografia.

Personagens novos:
- **Liora:** rastreadora que perdeu a irmã após a névoa imitar sua voz; inicia a missão do Lobo da Névoa.
- **Arven:** vigia e cartógrafo; pede ervas para marcar uma trilha mais segura.
- **Yara:** cartógrafa das marés, cuja bússola aponta para o que foi perdido; inicia a missão do Leviatã de Vidro.
- **Neris:** arquivista dos naufrágios, que guarda registros contraditórios.
- **Descobertas ambientais:** altar das raízes e naufrágio sem nome recompensam leitura e investigação.

### Progressão e clima
- Cada nível concede um ponto de atributo e um ponto de talento. Força aumenta dano, Defesa reduz dano de ataques táticos, Vitalidade aumenta vida máxima e Sabedoria aumenta cura. Golpe Treinado, Postura de Pedra e Mãos Cuidadoras são talentos de até 3 ranks.
- Relógio in-game persistente, começando às 08:00, avança um minuto por quatro segundos reais. Luz e UI lêem o relógio salvo.
- Clima local pode ser limpo, chuva, folhas ou névoa. No modo dinâmico, cada estado dura um período aleatório de 35–190 segundos; a duração e o tipo atual entram no save.
- O calendário diário tem cobre todos os dias, ervas no dia 3, minério no dia 5 e uma poção no dia 7. Os prêmios são locais ao navegador, não globais.

### Migração e teste
A migração de save fornece defaults para os novos atributos, relógio, clima, regiões e estados de missão, mantendo personagens antigos. A sintaxe JavaScript do script principal foi conferida após o reboot; o próximo passo de QA é testar no navegador todas as rotas de região, diálogos, turn-in de missão, pontos de atributo/talento e combate contra chefes em desktop e celular.

## Histórico — Reboot 1.1 (direção de classes substituída pelo Reboot 2.0)

- **Classes disponíveis:** Guerreiro (vida e defesa), Patrulheiro (alcance), Arcanista (explosão em área) e Guardião (escudo e vida extra). Cada uma define valores base e um poder desbloqueado no nível 2.
- **Dano determinístico:** os danos base vêm de tabelas por classe/inimigo e são modificados de forma explícita por dificuldade, atributos, perícias e fúria de chefe. Não há rolagem aleatória de dano em combate de exploração ou no turno tático.
- **Dificuldades:** Aventureiro (menos dano recebido, maior dano causado), Sobrevivente (padrão) e Lenda Sombria (mais dano recebido, menos dano causado).
- **Poderes:** Ruptura do Guardião, Tiro Perfurante, Explosão Arcana e Muralha Viva. Ativação por tecla Q/botão e recarga por classe; a carta de poder também entra no combate tático.
- **Perícias universais:** Golpe Treinado, Postura de Pedra e Mãos Cuidadoras. Especializações da classe: Olho de Falcão, Maestria Arcana e Baluarte, com ranks e requisito de classe.
- **Atlas e mapa:** rota esquemática entre regiões, bússola, avisos de perigo e trilha de pedra para reforçar a orientação visual.
- **Migração de salvamentos:** classe, dificuldade e escudo persistem; salvamentos legados recebem defaults sem apagar missões ou progresso existente.

**QA pendente:** a sintaxe JavaScript e verificações estáticas passaram, mas ainda é necessário validar uma sessão completa de jogo e ajustar os números após testes práticos em desktop e celular.

## Reboot 2.0 — aventura 16-bit e criaturas

A direção ativa abandona o combate lateral e a ênfase em classes de RPG em favor de uma aventura de exploração top-down em pixel art, com inspiração geral nos jogos portáteis antigos. Personagens e criaturas são criações próprias do projeto.

### Exploração e personagens
- As quatro áreas jogáveis usam visão superior: Brumaforte, Bosque Velado, Lago Silencioso e Mina Antiga. A mina foi convertida de plataformas laterais para um mapa com caminhos, paredes quebradas, plantas, lampiões, altar e livro-razão.
- O protagonista, os NPCs e a prévia do criador compartilham proporções compactas de sprite portátil; nomes destacados e silhuetas por função mantêm a leitura do mapa. O criador usa roupas como padrão, boné/capuz/tiara e acessórios simples; a aparência antiga de corpo-base migra para viajante.
- A arte dos parceiros e criaturas é desenhada em pixel art pelo cliente, para não depender de emojis na interface de equipe e no duelo.

### Parceiros, encontros e progressão
- Ao iniciar uma nova jornada, escolha Folhote, Braseco ou Gotil como primeiro parceiro.
- As criaturas selvagens incluem Musguito, Casquim, Vesperto, Ossoeco e Guardito, além dos encontros únicos Brumilobo e Prismaré.
- Os encontros são por turnos: movimentos com dano fixo, barra de vida, cura, troca de parceiro, fuga e captura por Laço de Semente quando a criatura fica suficientemente enfraquecida. Chefes únicos de história não são capturáveis.
- A equipe aceita até seis criaturas; vitória concede experiência e as criaturas sobem de nível. O Centro de Amizade recupera a vida da equipe por cobres fictícios.
- Salvamentos existentes são migrados com um parceiro inicial padrão; novas jornadas mostram a seleção inicial. A equipe capturada, os níveis e o parceiro ativo ficam no save local.

### Critérios de teste para concluir o reboot
1. Validar movimento, colisões e retorno entre mina e vila.
2. Confirmar escolha inicial, seleção de equipe, captura, fuga, derrota, cura, evolução e salvamento/carregamento.
3. Testar diálogos, missões de NPCs, chefes de história e decisões econômicas em desktop e celular.
4. Conferir que nenhum texto ou botão ainda apresenta o antigo sistema de combate lateral, classes de RPG ou combate por cartas como comportamento ativo. Verificar também que o criador e os saves antigos não renderizam o protagonista sem roupa.

## Reboot 3.0 — arte de portátil e exploração top-down

A direção ativa agora é uma aventura própria de exploração 16-bit, inspirada na simplicidade visual dos portáteis clássicos. Não é necessário tratar a experiência como um RPG de classes: o foco é caminhar, descobrir lugares, conversar, conhecer criaturas e batalhar por turnos.

- **Protagonista:** sprite compacto de 16×24 pixels, quatro direções e ciclos curtos de caminhada. Cabelo, tom de pele, roupa e acessórios continuam personalizáveis.
- **NPCs:** compartilham o mesmo padrão de proporção e escala, usando paletas e detalhes próprios para que cada morador seja legível sem parecer um guerreiro de fantasia pesada.
- **Criador:** prévia compacta em pixel art, com uma paleta clara e proporções consistentes com o personagem no mapa.
- **Interface e terreno:** paleta de céu, grama, pedra e painéis claros; árvores quadradas, caminhos legíveis e uma bússola adequada ao estilo portátil.
- **Movimento de exploração:** movimento ortogonal para reduzir o deslizamento diagonal e reforçar a sensação de jogo de portátil.
- **Continuidade:** regiões, missões da Moeda Partida, decisões do Conselho, criaturas, captura e equipe por turnos permanecem. As criaturas e personagens são criações originais do projeto.

**Validação:** sintaxe JavaScript, IDs de interface e pontos de integração foram conferidos por análise estática. Ainda é necessário validar visualmente uma jornada completa em desktop e celular.

## Fronteira entre protótipo e mundo online
O clima é visual local e não representa um evento sincronizado. Recompensas, conquistas, materiais, chefes e decisões ainda são locais ao navegador. Para contas multiplataforma, rankings públicos, guildas, comércio, eventos sincronizados e coop/PvP, usar autenticação e estado autoritativo no servidor; não confiar no navegador para validar itens ou recompensas.
