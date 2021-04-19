FROM tomcat:latest

RUN apt-get install -y git

RUN apt install -y maven

WORKDIR /home/CGG/

RUN git clone https://github.com/jleetutorial/maven-project

RUN touch index.jsp 

RUN echo "Hola, Soy César Gómez" > index.jsp

WORKDIR /maven-project

COPY /home/cgg/index.jsp /webapp/src/main/webapp/

WORKDIR /maven-project/webapp

RUN mvn package

ADD maven-project.war /maven-project/webapps
