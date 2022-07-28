# решение тестового задание

для решения тестового задания был выделен отдельный сервер , на котором подняты все сервисы:

приложение app.py
http://45.135.164.232:5000

метрики приложения
http://45.135.164.232:5000/metrics

prometheus сервис
http://45.135.164.232:9090

grafana сервис
http://45.135.164.232:3000

ссылка на график в grafana  (обновление каждые 5 секунд)
http://45.135.164.232:3000/d/_eX4mpl3/example-dashboard?orgId=1&refresh=5s&from=now-5m&to=now

_____________________________________________________________________________________________________________

для развертывание контейнеров был выбран Kubernetes с реализацией при помощи Minikube (хорошо подходит для тестирования небольших задач)

для каждого сервиса был создан локальный образ docker контейнера, который запускается в отдельном поде 

![ScreenShot](/screenshots/1.png)

для удобства визуализации все порты были простым способом проброшены на основной ip c помощью демона, так же все работает и на localhost


![ScreenShot](/screenshots/5.png)



скриншоты работающих сервисов

![ScreenShot](/screenshots/3.png)

![ScreenShot](/screenshots/4.png)


тестирование приложения на нагрузку 100 запросов в секундy с помощью Apache Benche (видео с демонстрацией в папке скриншотов)
![Watch the video](https://disk.yandex.ru/client/disk/тест%20девопс?idApp=client&dialog=slider&idDialog=%2Fdisk%2Fтест%20девопс%2Fsimplescreenrecorder-2022-07-29_00.30.16.mkv)


ответ утилиты:

This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 45.135.164.232 (be patient).....done


Server Software:        Werkzeug/2.2.0
Server Hostname:        45.135.164.232
Server Port:            5000

Document Path:          /
Document Length:        17 bytes

Concurrency Level:      10
Time taken for tests:   5.703 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      19100 bytes
HTML transferred:       1700 bytes
Requests per second:    17.53 [#/sec] (mean)
Time per request:       570.335 [ms] (mean)
Time per request:       57.033 [ms] (mean, across all concurrent requests)
Transfer rate:          3.27 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       11   12   0.8     12      15
Processing:   519  555  31.5    550     603
Waiting:       18   26   5.6     25      41
Total:        530  567  31.7    562     615

Percentage of the requests served within a certain time (ms)
  50%    562
  66%    574
  75%    601
  80%    614
  90%    615
  95%    615
  98%    615
  99%    615
 100%    615 (longest request)

вывод: приложение хорошо справилось с нагрузкой, нет зафейленного запроса


повторный тест и скриншот
![ScreenShot](/screenshots/7.png)


конфигурация графика (grafana json)

{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "description": "dwwd",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 8,
  "links": [],
  "liveNow": true,
  "panels": [
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 20,
        "w": 23,
        "x": 0,
        "y": 0
      },
      "hiddenSeries": false,
      "id": 2,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": true,
        "show": true,
        "sort": "avg",
        "sortDesc": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "9.0.5",
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "$$hashKey": "object:214",
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "expr": "rate(flask_http_request_duration_seconds_count{status=\"200\"}[30s])",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ path }}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeRegions": [],
      "title": "Requests per second",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "mode": "time",
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "$$hashKey": "object:376",
          "format": "short",
          "logBase": 1,
          "show": true
        },
        {
          "$$hashKey": "object:377",
          "format": "short",
          "logBase": 1,
          "show": true
        }
      ],
      "yaxis": {
        "align": false
      }
    }
  ],
  "refresh": "5s",
  "schemaVersion": 36,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-5m",
    "to": "now"
  },
  "timepicker": {
    "hidden": false,
    "nowDelay": "10ms",
    "refresh_intervals": [
      "5s",
      "10s"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Example dashboard",
  "uid": "_eX4mpl3",
  "version": 19,
  "weekStart": ""
}
