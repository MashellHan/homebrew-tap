cask "eye-guard" do
  version "3.0"
  sha256 "6f9a056291622ff4555ac960e54582a0ec9f9f8326c27d4e1b76f14046e5d505"

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
