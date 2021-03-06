# SwiftStars
Aplicativo iOS que lista os repositórios com mais estrelas em ordem decrescente. Criado com XCode e command line tools na versão do XCode 10.3.

## Instalação

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
rvm reload
source /Users/`whoami`/.rvm/scripts/rvm && rvm get master && rvm install 2.5.1 && rvm use 2.5.1
```

- [Bundler](https://bundler.io/)
```
gem install bundler
```

Para instalar/atualizar as dependências:

```
bundle install
bundle exec fastlane setup
```

## Testes
Para rodar todos os testes (Unitários e Snapshot)
```
bundle exec fastlane ios run_all_tests
```

Para rodar slather e ver a cobertura dos testes (abrirá o relatório no navegador)
```
bundle exec fastlane ios run_slather
```
