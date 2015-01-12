# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'pryaws'
  s.version     = '0.0.5'
  s.license     = 'Apache 2'
  s.date        = '2013-11-15'
  s.summary     = 'Interactive AWS console using Ruby Pry.'
  s.description = 'Loads a batch of helpers that make the AWS SDK easier to interact with and drop to binding.pry().'
  s.homepage    = 'https://github.com/haku/pryaws'
  s.authors     = ['haku']

  s.files       = ['lib/pryaws.rb',
                   'lib/pryaws/auto-scaling.rb',
                   'lib/pryaws/cloud-formation.rb',
                   'lib/pryaws/ec2.rb',
                   'lib/pryaws/sns.rb']
  s.executables = ['pryaws']
  s.test_files  = []
  s.require_paths = ['lib']

  s.add_dependency 'aws-sdk', '~> 1.60.2'
  s.add_dependency 'pry', '~> 0.10.1'
end
