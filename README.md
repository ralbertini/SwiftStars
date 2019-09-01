# SwiftStars

Ferramentas necessárias para rodar a aplicação:

- [Homebrew](https://brew.sh/)
```
/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- [Carthage](https://github.com/Carthage/Carthage)
```
brew install carthage
```
- [RVM](https://rvm.io/rvm/install)
```
curl https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer | bash -s stable
source /Users/`whoami`/.rvm/scripts/rvm && rvm get master && rmm install 2.5.1 && rvm use 2.5.1
```
- [fastlane](https://github.com/fastlane/fastlane)
```
# Using RubyGems
sudo gem install fastlane -NV

# Alternatively using Homebrew
brew cask install fastlane
```
Para instalar as dependências:

```
bundle install
bundle exec fastlane setup
```

Para rodar todos os testes (Unitários e Snapshot)
```
bundle exec fastlane ios run_all_tests
```

Para rodar slather e ver a cobertura dos testes (abrirá o relatório no navegador)
```
bundle exec fastlane ios run_slather
```
