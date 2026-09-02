class Speech < Formula
  desc "AI speech models for Apple Silicon — ASR, TTS, speech-to-speech"
  homepage "https://github.com/soniqo/speech-swift"
  url "https://github.com/soniqo/speech-swift/releases/download/v0.0.27/speech-macos-arm64.tar.gz"
  version "0.0.27"
  sha256 "2c2474bdd36d69fb07fa505b08b8798af58b61b572f754cea31c2e6b118e8a2d"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # `speech`/`speech-server` are canonical; `audio`/`audio-server` are
    # deprecated aliases retained for one release cycle. Older release tarballs
    # only carry the `audio` names, so install whichever is present.
    %w[speech speech-server audio audio-server mlx.metallib].each do |f|
      libexec.install f if File.exist?(f)
    end
    # Install every SPM-generated resource bundle next to the binary.
    # Kokoro needs its own pronunciation dicts; MAGNeT/VoxCPM2/Qwen3 pull
    # tokenizers via swift-transformers_Hub.bundle; Magpie ships baked
    # speaker tables. Globbing keeps future modules from silently breaking.
    Dir["*.bundle"].each { |b| libexec.install b }

    %w[speech speech-server audio audio-server].each do |name|
      bin.write_exec_script libexec/name if (libexec/name).exist?
    end
  end

  test do
    primary = (bin/"speech").exist? ? "speech" : "audio"
    server  = (bin/"speech-server").exist? ? "speech-server" : "audio-server"
    assert_match "AI speech models", shell_output("#{bin}/#{primary} --help")
    assert_match "HTTP API server", shell_output("#{bin}/#{server} --help")
  end
end
