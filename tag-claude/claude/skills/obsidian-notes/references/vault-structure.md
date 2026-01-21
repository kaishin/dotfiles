# Vault Structure Reference

Complete folder structure and categorization rules for the Obsidian vault.

## Folder Hierarchy

```
Vault/
├── Development/          # Programming and software development
│   ├── Swift/           # 30+ notes - Swift, SwiftUI, visionOS
│   ├── Android/         # 14 notes - Android, Kotlin, Compose
│   ├── Web/             # Web development (Astro, Tanstack, etc.)
│   └── Tools/           # Dev tools (Godot, Fly.io, deployment)
│
├── AI-ML/               # Artificial intelligence and machine learning
│   ├── Concepts/        # Core ML concepts (neural nets, transformers)
│   ├── Techniques/      # Methods (RAG, LoRA, embeddings, fine-tuning)
│   ├── Platforms/       # Tools (Claude, MCP, prompt engineering)
│   └── Philosophy/      # Ethics, alignment, debates (Chinese Room, etc.)
│
├── Finance/             # Financial topics
│   ├── Trading/         # Strategies, technical analysis, backtesting
│   ├── Investing/       # ETFs, funds, tax strategies
│   └── Markets/         # Crypto, options, hedging
│
├── Knowledge/           # Learning and knowledge management
│                        # Spaced repetition, FSRS, knowledge graphs
│
├── Languages/           # Natural languages
│                        # Chinese, Swedish, Norwegian, Japanese
│
├── Life/                # Personal development
│                        # Health, philosophy, hobbies
│
├── Reference/           # General reference material
│                        # Technical concepts, databases, business
│
├── Agents/              # Agent configurations (preserved)
├── Drafts/              # Draft content (preserved)
├── Gameflint/           # Game project files (preserved)
├── NO.MAD/              # Travel/location project (preserved)
└── Assets/              # Images and attachments
```

## Categorization Rules

### Development/Swift/
Keywords: Swift, SwiftUI, UIKit, visionOS, RealityKit, Xcode, iOS, macOS, watchOS, tvOS, @Observable, @State, @Binding, actors, async/await (in Swift context), Combine

Example notes:
- Swift 6 Concurrency.md
- SwiftUI Data Flow.md
- visionOS Interactions.md
- Xcode Build Settings.md

### Development/Android/
Keywords: Android, Kotlin, Jetpack, Compose, Room, Hilt, Dagger, KAPT, KSP, ProGuard, Play Store, APK, AAB, Gradle

Example notes:
- Android State Management.md
- Jetpack Compose Navigation.md
- Android Room Patterns.md

### Development/Web/
Keywords: JavaScript, TypeScript, React, Vue, Astro, Next.js, Node, npm, HTML, CSS, Tailwind, Cloudflare, Vercel

Example notes:
- Astro.js.md
- Tanstack Query.md
- Cloudflare Cookbook.md

### Development/Tools/
Keywords: Godot, Unity, deployment, CI/CD, Docker, Fly.io, general dev tools

### AI-ML/Concepts/
Keywords: neural network, deep learning, activation function, gradient, backpropagation, perceptron, CNN, RNN, LSTM, GRU, architecture (neural), layer, neuron

Example notes:
- Neural Networks.md
- Activation Functions.md
- Gradient Descent.md
- Transformers.md

### AI-ML/Techniques/
Keywords: RAG, retrieval, embeddings, vector, semantic search, fine-tuning, LoRA, QLoRA, RLHF, RLAIF, diffusion, stable diffusion, training, inference, quantization, distillation

Example notes:
- RAG Architectures.md
- Vector Databases.md
- Semantic Search.md
- LoRA Fine-tuning.md

### AI-ML/Platforms/
Keywords: Claude, GPT, OpenAI, Anthropic, MCP, Model Context Protocol, prompt engineering, LLM, chatbot, API (AI), agent (AI)

Example notes:
- Claude API.md
- Model Context Protocol.md
- Prompt Engineering.md

### AI-ML/Philosophy/
Keywords: alignment, AGI, consciousness, ethics (AI), safety (AI), Chinese Room, Turing test, sentience, superintelligence

Example notes:
- AI Alignment.md
- Chinese Room.md
- Cartesian Dualism.md

### Finance/Trading/
Keywords: trading, technical analysis, candlestick, chart, momentum, mean reversion, backtest, strategy (trading), indicator, RSI, MACD, moving average

Example notes:
- Technical Analysis.md
- Momentum Strategies.md
- Backtesting Strategies.md

### Finance/Investing/
Keywords: investing, ETF, mutual fund, portfolio, allocation, dividend, compound, retirement, 401k, IRA, tax (investing)

Example notes:
- ETF Strategies.md
- Portfolio Allocation.md
- Tax-Loss Harvesting.md

### Finance/Markets/
Keywords: crypto, Bitcoin, Ethereum, blockchain, DeFi, options, derivatives, futures, hedging, forex

Example notes:
- Crypto Basics.md
- Options Trading.md
- Hedging Strategies.md

### Knowledge/
Keywords: knowledge graph, spaced repetition, Anki, FSRS, learning, memory, recall, retention, flashcard, graph database

Example notes:
- Knowledge Graphs.md
- FSRS Algorithm.md
- Spaced Repetition Algorithms.md

### Languages/
Keywords: Chinese, Mandarin, Cantonese, Japanese, Swedish, Norwegian, language learning, vocabulary, grammar, characters, kanji, hanzi

Example notes:
- 100 Most Used Chinese Words.md
- Swedish Grammar.md

### Life/
Keywords: health, habit, exercise, meditation, philosophy (personal), hobby, drumming, photography, personal

Example notes:
- Health Habits.md
- Photo Editing Workflow.md

### Reference/
Default category for:
- Technical concepts (3D, hexadecimal, entropy)
- Databases (SQLite, MongoDB, Kafka)
- Business topics (startup metrics, user acquisition)
- Automotive (HEV, rotary engine)
- Anything that doesn't fit elsewhere

## Note Format Examples

### Concept Note
```markdown
Brief definition or introduction to the concept.

## Key Points

- Point 1
- Point 2
- Point 3

## Details

Expanded explanation with examples.

## Related

- [[Related Note 1]]
- [[Related Note 2]]
```

### Technical Note
```markdown
Brief description of the technology/technique.

## Usage

`code example`

## Configuration

Settings or parameters.

## Examples

Practical examples with code blocks.

## See Also

- [[Related Tech]]
```

### Glossary-Heavy Note
```markdown
Overview paragraph.

## Glossary

**Term 1** - Definition of term 1.

**Term 2** - Definition of term 2.

## Methodology / Process

### Step 1
Description

### Step 2
Description
```
