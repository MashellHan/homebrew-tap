cask "eye-guard" do
  version "3.3.0"
  sha256 "6a09722a6c6c08863206550d6ec48dc16849b19bb12f676bc10c4fabb074901f"

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
