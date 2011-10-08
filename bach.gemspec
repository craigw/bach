# -*- encoding: utf-8 -*-
lib = File.expand_path '../lib/', __FILE__
$:.unshift lib unless $:.include? lib

require 'bach/version'

Gem::Specification.new do |s|
  s.name        = "bach"
  s.version     = Bach::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Craig R Webster"]
  s.email       = ["craig@barkingiguana.com"]
  s.summary     = "Text-to-Speech as a service"
  s.description = "Provide a Text-to-Speech service on the service bus"

  s.files       = Dir.glob("{lib,bin}/**/*") + %w(README.md)
  s.executables = Dir.glob("bin/**/*").map { |bin| bin.gsub(/^bin\//, '') }

  s.add_dependency 'stomp'
  s.add_dependency 'espeak-ruby'
  s.requirements << 'A broker capable of talking Stomp'
  s.requirements << 'A server with Lame and eSpeak installed'
end
