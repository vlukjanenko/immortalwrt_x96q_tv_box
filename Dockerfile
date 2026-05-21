# Используем Ubuntu 22.04 или 24.04 как стабильную базу
FROM ubuntu:22.04

# Не задаем вопросы при установке
ENV DEBIAN_FRONTEND=noninteractive

# Установка зависимостей, необходимых для сборки ImmortalWrt
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    flex \
    bison \
    g++ \
    gawk \
    gcc-multilib \
    g++-multilib \
    gettext \
    git \
    libncurses-dev \
    libssl-dev \
    python3-distutils \
    python3-setuptools \
    python3-dev \
    swig \
    rsync \
    unzip \
    zlib1g-dev \
    file \
    wget \
    curl \
    time \
    subversion \
    fastjar \
    busybox \
    sudo \
    && apt-get clean

# Создаем пользователя build, так как сборка под root не рекомендуется
RUN useradd -m build && echo 'build ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/build
USER build
WORKDIR /home/build

# Устанавливаем переменную окружения для локали
ENV LANG=C.UTF-8
