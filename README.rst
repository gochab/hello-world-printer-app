Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::

    source /usr/bin/virtualenvwrapper.sh     - mozna to dodac bezposrednio do BASH poprzez: atom $HOME/ .BASHRC

    # na UBUNTU podajemy inną scieżkę: source /usr/local/bin/virtualenvwrapper.sh  ; jesli nie jestesmy pewni gdzie szukać virtualenvwrapper to komenda: where is virtalenvwrapper

    *  mkvirtualenv wsb-simple-flask-app

    #na UBUNTU virtualenv tworzymy przez virtualenv name_of_virtual_env

    pip install -r requirements.txt
    pip install -r test_requirements.txt

- Uruchamianie applikacji:

  ::

  	# jako zwykły program
    python main.py

    # albo:
    PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    PYTHONPATH=. py.test
    PYTHONPATH=. py.test  --verbose -s


- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    source /usr/bin/virtualenvwrapper.sh - to zostalo dodane i trzeba wlaczyc
    workon wsb-simple-flask-app


- Integracja z TravisCI:
 heroku auth:token  - i kopiowac otrzymany numer w travisie
 uzupelninie pliku .travis.yml o deploy
 wprowadzenie do travisa uprawnien HEROKU_API_KEY + TOKEN
 ZMODYFIKOWANIE views.py i odpowiednio test_views.py to github
 travis - sprawdzenie czy przeszlo

- statuscake:
dodanie testu - url testu to ten po open app z heroku

Pomocnicze
==========

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    yum install python-pip
    pip install virtualenv
    pip install virtualenvwrapper

- Instalacja docker-a:

  ::

    yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    yum install -y yum-utils

    yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    yum makecache fast
    yum install docker-ce
    systemctl start docker




Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
