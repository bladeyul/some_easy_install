这个安装基于博客https://cloud.tencent.com/developer/article/1380272

需要个人去下载hadoop-3.2.0.tar.gz和jdk-8u181-linux-x64.tar.gz

#安装步骤
1、拷贝项目
  
  git pull https://github.com/bladeyul/some_easy_install/hadoop
  
2、生成镜像
  
  docker build -t="centos7-ssh" -f Dockerfile1
  docker build -t="hadoop" -f Dockerfile2
  
3、启动容器
  
