cask "eye-guard" do
  version "3.1.1"
  sha256 "3a57262ed579a2e1c2262df4113182ca6a8ef8238c1690fbbbc0f47da565622f"

  url "https://github.com/MashellHan/eye-guard/releases/download/v#{version}/EyeGuard.dmg"
  name "EyeGuard"
  desc "Medical-grade eye health guardian for macOS with 20-20-20 rule reminders"
  homepage "https://github.com/MashellHan/eye-guard"

  depends_on macos: ">= :sonoma"

  app "EyeGuard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/EyeGuard.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.eyeguard.app.plist",
  ]
end
