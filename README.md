# zbx
Всем привет!  Меня зовут Сергей, я внедряю и сопровождаю мониторинг, вот уже пару лет. Пишу “буклет”, где ты читатель найдешь вводную информацию о технологиях, и практический пример внедрения системы мониторинга Zabbix по типу “полный дом”. Можно запустить все компоненты или выбрать нужные, а можно запустить компоненты на разных машинах в кластере, и после запуска компоненты готовы к работе. Своей целью я поставил быстрое и простое внедрение мониторинга, с экономией ресурсов, и отказоустойчивостью, получилось или нет? Читай ниже, спасибо за внимание!

Начнем с технологии, которая сегодня везде, и она стандарт в построении производства. По виртуализации есть книги, статьи, и много информации в интернете, здесь я дам общее понимание. Технология виртуализации позволяет разделить и изолировать ресурсы компьютера, запуская виртуальные экземпляры машин управляемых гипервизором. Гипервизор - это программа которая управляем всеми вычислительными, сетевыми ресурсами и ресурсами хранения компьютера. Возможность разграничивать ресурсы компьютера, позволяет эффективнее использовать ресурс машины в производстве. У меня есть отдельная машина, там есть операционная система в которой работает база данных, и базе данных не нужны все мощности, она отлично работает с каким то своим условным набором, а остальные простаивают. Разделив ресурсы можно установить еще одну операционную систему, а внутри нее еще базу данных, веб-сервер и т.д. Исторически, сложилось 3 типа: полная, пара и контейнеризация. Полная и пара подойдут под пример выше, эти типы имеют свои детальные особенности, под свои условия, о них говорить не буду, больше о контейнеризации. Контейнеризация - представляет более легковесный и гибкий способ внедрения приложений, позволяет запускать изолированные контейнеры, как процессы на машине, используя систему и ее ядро. При общепринятом подходе для внедрения сервиса предоставляется отдельная машина, контейнеризация идет вперед и отходит от общепринятого подхода, переходя в изолированную структуру которую относят к микрослужбам. 

Если тебя, как и меня читатель двигают идеи о движении к передовому внедрению то книги: Сэм Ньюмен, "От монолита к микросервисам" и "Ускоряйся. Наука DevOps" от Джез Хамбл, Джин Ким будем отличным дополнительным источникам получения идей. Я врятли смогу в краткой форме изложить суть, вместо этого я попробую дать “зацепки”.
