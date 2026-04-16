cask "eye-guard" do
  version "3.1"
  sha256 "38e3e5579813d38515ea505879b9278812e1b9b1d4c45ef15cdf8fa7dca31231"

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
