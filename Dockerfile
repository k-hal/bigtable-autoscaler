FROM openjdk:8-jre

ENTRYPOINT [ "/usr/bin/java", "-cp", "/usr/share/bigtable-autoscaler/bigtable-autoscaler.jar:/usr/share/bigtable-autoscaler/lib/*", "com.spotify.autoscaler.Main"]

# Add Maven dependencies (not shaded into the artifact; Docker-cached)
ADD target/lib           /usr/share/bigtable-autoscaler/lib
# Add the service itself
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/share/bigtable-autoscaler/bigtable-autoscaler.jar
