# Soniqo Homebrew Tap

Homebrew formulas for [Soniqo](https://soniqo.audio) on-device speech tools.

## Install

```bash
brew install soniqo/tap/speech
```

That installs:

- `speech` — CLI for ASR, TTS, speech-to-speech, voice cloning, VAD, speaker diarization, speech enhancement, forced alignment, wake-word detection, and translation
- `speech-server` — local HTTP / WebSocket server with an OpenAI Realtime API–compatible endpoint

Run `speech --help` or `speech-server --help` to see the full surface.

## Requirements

- macOS 15 (Sequoia) or newer
- Apple Silicon (M-series chip)

Models are downloaded automatically from Hugging Face on first use and cached under `~/Library/Caches/qwen3-speech/`.

## Formulas

| Formula | Description | License |
|---|---|---|
| [`speech`](Formula/speech.rb) | AI speech toolkit (Apache-2.0) — built from [soniqo/speech-swift](https://github.com/soniqo/speech-swift) | Apache-2.0 |

## Source

Library source lives at [soniqo/speech-swift](https://github.com/soniqo/speech-swift). The tap is auto-bumped on each upstream release.

## License

The tap itself is Apache-2.0. Individual formulas may install software under their own licenses — see each formula's `license` line.
