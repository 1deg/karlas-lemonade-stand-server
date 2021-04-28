FROM codercom/code-server:3.8.1

LABEL maintainer=angel@1degree.org

USER root

RUN apt-get update

RUN apt-get install wget -y

        # In case Python is needed

        # RUN wget https://bootstrap.pypa.io/get-pip.py

        # RUN apt-get install python3-distutils -y

        # RUN python3 get-pip.py --prefix=/usr/local/ --disable-pip-version-check --no-cache-dir

        # RUN rm -f get-pip.py

RUN apt-get install software-properties-common -y

RUN apt-get install -y gnupg2

RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

WORKDIR /vscode

        # RUN curl -sSL https://get.rvm.io -o rvm.sh

        # RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

        # RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 6A030B21BA07F4FB

# P B
USER coder

        # USER coder

        # RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

        # RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

        # RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 6A030B21BA07F4FB

        # RUN cat rvm.sh | bash -s stable --rails

        # USER root
        # #
        # RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

        # RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 6A030B21BA07F4FB

        # RUN apt-get update

        # RUN apt-get install libssl1.0-dev -y

# P B
COPY ./.rvm /home/coder/.rvm

SHELL ["/bin/bash", "-c"] 

RUN source /home/coder/.rvm/scripts/rvm  

        #USER coder

        #RUN bash /home/coder/.rvm/scripts/rvm install 2.3.3

USER root
#
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 6A030B21BA07F4FB

RUN apt-get update

RUN apt-get install libssl1.0-dev -y 
        # libssl1.0-dev is a dependency to allow 2.3.3 to run
        #RUN /home/coder/.rvm/scripts/rvm use 2.3.3

        #RUN gem install bundler -v 1.17.3

COPY ./Gemfile /vscode/Gemfile
COPY ./package.json /vscode/package.json

# RUN bundle install

WORKDIR /vscode

USER root

RUN chown coder:coder /vscode

RUN chown coder:coder /home/coder/

USER coder

SHELL ["/bin/bash", "-c"] 

RUN echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc

RUN source ~/.bashrc

RUN bash --login

RUN ~/.rvm/bin/rvm use 2.3.3

# try to fix sources list

USER root

#tomrrow try comments this out and manuyally do it in the server
COPY ./ubuntu.sources.list /etc/apt/sources.list

# fixes RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

RUN apt-get install -y build-essential
        #Replaces RUN apt-get install gawk g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl1.0-dev -y
RUN apt-get install gawk g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev -y
# run manually; chmod -R 777 ~/.rvm
# run manually; chown coder:coder /home/coder
# run manually: rvm use 2.3.3
# run manually: gem install bundler -v 1.17.3  bundle _1.17.3_ install
# run manually: cd /vscode/rails
# run manually: bundle install


RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install -y nodejs

RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN npm install bower -g --allow-root

USER coder

WORKDIR /vscode

RUN npm install 
