= Подготовка стенда для тестирования

Необходимо установить последние версии программного обеспечения: Apache Jmeter и Taurus.

== Apache Jmeter

https://jmeter.apache.org/download_jmeter.cgi

wget http://apache.lauf-forum.at//jmeter/binaries/apache-jmeter-5.0.tgz
sudo tar zxvf apache-jmeter-5.0.tgz -C /opt



== Плагины Jmeter

* https://jmeter-plugins.org/wiki/ThroughputShapingTimer/
* https://github.com/Blazemeter/jmeter-bzm-plugins/blob/master/random-csv-data-set/RandomCSVDataSetConfig.md

wget https://jmeter-plugins.org/files/packages/jpgc-tst-2.5.zip
wget https://jmeter-plugins.org/files/packages/bzm-random-csv-0.6.zip

sudo unzip -d /opt/apache-jmeter-5.0/lib/ext/ jpgc-tst-2.5.zip
sudo unzip -d /opt/apache-jmeter-5.0/lib/ext/ bzm-random-csv-0.6.zip

== Taurus

https://gettaurus.org/

=== Windows

wget https://gettaurus.org/msi/TaurusInstaller_1.13.1_x64.exe

=== Linux

==== Ubuntu

sudo apt-get update
sudo apt-get install python default-jre-headless python-tk python-pip python-dev libxml2-dev libxslt-dev zlib1g-dev net-tools
sudo pip install bzt

=== BlazeMeter

https://www.blazemeter.com/

Генерация и получение ключа для сервиса BlazeMeter:
https://guide.blazemeter.com/hc/en-us/articles/115002213289-BlazeMeter-API-keys-

=== Конфигурация bzt

==== Linux

Создать файл $HOME/.bzr-rc

```
# BlazeMeter reporting settings

modules:
  blazemeter:
     token: <API TOKEN>

     #test: 
     #project: 
     public-report: false  # set to true to create a public link to the report

     browser-open: start  # auto-open the report in browser,
                          # can be "start", "end", "both", "none"
     send-interval: 30s   # send data each n-th second
     timeout: 5s  # connect and request timeout for BlazeMeter API
     artifact-upload-size-limit: 10  # limit max size of file (in megabytes)
                                    # that goes into zip for artifact upload, 10 by default
     check-interval: 5s  # interval which Taurus uses to query test status from BlazeMeter

---

# JMeter settings

modules:
  jmeter:
    properties:  # JMeter properties for every JMeter run
      prop_name: prop value
    system-properties:  # Java system properties
      sun.net.http.allowRestrictedHeaders: "true"
    memory-xmx: 4G  # allow JMeter to use up to 4G of memory
    path: <Apache Jmeter exe file>  # path to local jmeter installation
    version: 5.0  # version to use
    plugins:  # plugins to install
    - jpgc-json=2.2
    - jmeter-ftp
    - jpgc-casutg

```

