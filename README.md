# scala-sbt_docker_environment

Scala(sbt) 実行環境の Docker プロジェクト。

```sh
$ docker build . -t tomoyamkung/scala-sbt
Sending build context to Docker daemon  4.608kB
:
:
Successfully tagged tomoyamkung/scala-sbt:latest
```

例：コンテナに入って、カレントディレクトリと `-v` オプションでディレクトリが同期されていることを確認する
```sh
$ docker run -v $PWD:/home/dev -it --rm tomoyamkung/scala-sbt bash
bash-5.0$ pwd
/home/dev
bash-5.0$ ls
Dockerfile  README.md
```

例：ホスト側で `sbt` コマンドを実行する

```sh
$ docker run -v $PWD:/home/dev -it --rm tomoyamkung/scala-sbt sbt --help
Usage: sbt [options]
:
:
In the case of duplicated or conflicting options, the order above
shows precedence: JAVA_OPTS lowest, command line options highest.
```
