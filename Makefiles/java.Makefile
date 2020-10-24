
CURL_API := $(shell curl -s https://api.github.com/repos/${ORG}/${REPO}/releases/latest | jq -r '.assets[] | select(.name| match("${REPO}-java-*")) | .url')

build:
	curl -L -H "Accept: application/octet-stream" $(CURL_API) --output ${REPO}-jar.zip
	unzip -o ${REPO}-jar.zip
	javac -cp ./*:src src/Server.java

run:
	java -cp ./*:src:. Server

clean:
	rm -f ${REPO}-*.zip ${REPO}-*.jar
