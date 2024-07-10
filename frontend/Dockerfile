
FROM ubuntu:20.04


ENV DEBIAN_FRONTEND=noninteractive
ENV FLUTTER_HOME=/opt/flutter
ENV PATH="$FLUTTER_HOME/bin:$PATH"


RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME


RUN echo "export PATH=$FLUTTER_HOME/bin:$PATH" >> /etc/profile

RUN /bin/bash -c "source /etc/profile && flutter doctor --android-licenses && flutter doctor"


WORKDIR /app


COPY . .


RUN /bin/bash -c "source /etc/profile && flutter pub get"


RUN /bin/bash -c "source /etc/profile && flutter build web"


FROM nginx:alpine
COPY --from=0 /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
