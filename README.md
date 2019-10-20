# Sample
Sample is a simple web application for testing communication between multiple servers using the HTTP protocol.

### Tech Stack
- **Backend** - _Java_ with  _Spring Boot 2.0_

- **Frontend** - _Java Servlet Pages_ with _JavaScript_

- **Database**  - in-mem _h2_ embbeded database

### Requirements
- _Oracle JDK 8 or JRE 8_ and higher

- _Tomcat >= 8.0_

## Installation
**Maven** is the build manager for this application.

To install dependencies and generate the Web Application Archive **WAR** file in ./target

Execute the following in the PROJECT_ROOT directory (home of pom.xml)

with **Java installed**

```bash
mvn install
```

or using the **standalone** plugin

```bash
./mvnw install
```
**Output:**


- <PROJECT_ROOT>/target/sample-0.0.1.war

- <PROJECT_ROOT>/target/ROOT.war
## Deployment
#### For standard server deployment
- Copy ROOT.war to the webapps/ folder in your tomcat server


#### Using Docker Compose to spin up 3 application servers
In the PROJECT_ROOT directory run
```bash
docker-compose up
```
- See docker-compose.yml for port numbers. Default: 8001, 8002, 8003


## Usage
- Access http://localhost:8080/ or http://{your-server-ip}:{port-number}/

- 8080 is the default tomcat server port number

## Configuration
/src/main/resources/application.yml



## License
[MIT](https://choosealicense.com/licenses/mit/)



