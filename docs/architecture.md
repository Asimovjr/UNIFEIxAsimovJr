# Arquitetura — PRG Mobile

> Placeholder. Base: guia de onboarding mobile da Asimov Jr.
> (`docs/01-arquitetura.md` e `docs/02-estrutura-de-projeto.md` do repositório
> `Lhferraaz/onboarding-mobile-asimovjr`).

## Padrão

MVVM com Riverpod, em camadas com responsabilidades separadas.

| Camada | Responsabilidade |
|--------|------------------|
| View | Exibir informações e receber interações do usuário |
| ViewModel | Controlar estado e coordenar ações da funcionalidade |
| Model | Representar os dados utilizados pela aplicação |
| Repository | Abstrair o acesso e a manipulação dos dados |
| Service | Encapsular integrações específicas com serviços externos |

## Fluxo de dados

```text
Usuário → Screen → ViewModel → Repository → Service → Firebase/API/SDK
                        ↓
                     Models
```

## Estrutura de pastas

```text
lib/
├── ui/
│   ├── core/
│   │   └── shared/
│   │       ├── widgets/     # componentes reutilizados entre features
│   │       └── themes/      # cores, tipografia, estilos globais
│   └── <feature>/
│       ├── screens/         # telas acessíveis via navegação
│       ├── view_models/     # estado e ações da feature
│       └── widgets/         # componentes específicos da feature
│
├── data/
│   ├── models/              # entidades de dados
│   ├── repositories/        # abstração de acesso a dados
│   └── services/            # Firebase, APIs, SDKs
│
├── config/                  # configurações, ambientes, inicializações
├── routing/                 # rotas, parâmetros, redirecionamentos
├── utils/                   # helpers genéricos (formatação, validações, extensions)
└── main.dart                # ponto de entrada

test/                        # testes automatizados (data/, ui/, utils/)
testing/                     # auxiliares de teste (fakes/, models/)
```

## Features previstas


## Observação

Esta arquitetura é uma **base recomendada**, não uma estrutura rígida. Adaptações
são válidas quando tecnicamente justificadas, desde que mantenham a separação
clara de responsabilidades.

## A definir