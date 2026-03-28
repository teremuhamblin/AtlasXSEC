#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "fileutils"

ROOT = File.expand_path("..", __dir__)
DIST = File.join(ROOT, "dist")
FileUtils.mkdir_p(DIST)

MODULES = %w[
  app
  security-engine
  security-services
  forensic-core
  reports
  sandbox
]

hash_file = File.join(DIST, "hashes_sha256.txt")
File.write(hash_file, "")

puts "\e[35m[AtlasXSEC] Packaging des modules\e[0m"

MODULES.each do |mod|
  mod_path = File.join(ROOT, mod)
  zip_path = File.join(DIST, "#{mod}.zip")

  puts "\e[36m→ #{mod}\e[0m"
  system("cd #{mod_path} && zip -r #{zip_path} . > /dev/null") or abort("Erreur ZIP")

  sha = Digest::SHA256.file(zip_path).hexdigest
  File.open(hash_file, "a") { |f| f.puts("#{mod}.zip  #{sha}") }
end

puts "\e[32mPackaging terminé. Hashes dans dist/hashes_sha256.txt\e[0m"
