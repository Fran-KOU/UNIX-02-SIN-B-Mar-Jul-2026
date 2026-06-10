# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.
FROM kalilinux/kali-rolling:latest

# ============= #
#  Section a    #
# ============= #

# The basic, read-only operating system snapshot that acts as our container's first filesystem blueprint is called a base 
# image (BHB Ch. 3). 
# Because Kali Linux is an industry-standard distribution that comes pre-configured with sophisticated network auditing libraries, 
# we specifically chose it to avoid having to manually compile crucial UNIX utilities from scratch.


# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.

# ============= #
#  Section b    #
# ============= #

# A read-only layered architecture is used to create docker images, with each instruction creating a new filesystem layer (BHB Ch. 3). 
# Docker caches these layers in order to maximize performance; if an instruction is changed, its cache and all levels that follow are invalidated. 
# In order to avoid sluggish, redundant rebuilds, hefty, static setup procedures must be positioned at the top of the instruction list.

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color

# ============= #
#  Section c    #
# ============= #

# According to BHB Chapter 1, ENV specifies permanent environment variables that are active during the image creation 
# and container runtime sessions.To avoid headless build freezes, DEBIAN_FRONTEND=noninteractive suppresses interactive 
# package installer dialogs. #LANG & LC_ALL=es_ES.UTF-8 adjusts the system localization and character encoding standard to 
# correctly render Spanish character sets.TERM=xterm-256color: Notifies terminal programs that full syntax highlighting is possible 
# with a 256-color palette.



# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections

# ============= #
#  Section d    #
# ============= #

# The pipeline operator (|) reroutes the echo command's standard output (stdout) into the debconf-set-selections standard input (stdin) (BHB Ch. 1). 
# In order to guarantee a fully automated, noninteractive build without freezing, this pre-seeds the Wireshark package's 
# configuration by responding to its interactive prompt beforehand (BHB Ch. 3).



# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \

# ============= #
#  Section e    #
# ============= #

# Install vs. apt-get update: update only retrieves the most recent list of software versions that are available from the repository. Install is responsible for downloading and setting up the software on the computer.

# -y: During installation, it automatically responds "yes" to any interactive questions. Docker builds require this in order to function without human intervention.
# --no-install-recommends instructs the package management to ignore "recommended" additional packages and only install absolute dependencies. Your container remains lightweight as a result.

# Why ONE large RUN: Each RUN command in a Dockerfile adds a new, long-lasting "layer" to the image. By chaining operations together, the final image size is kept significantly smaller by prev0enting temporary files or caches from being permanently baked into intermediate layers.

# "AND" is represented by the shell operator &&. It instructs the system to carry out the subsequent instruction only in the event that the preceding command is successful and error-free.

# Trailing \: A character that continues a line. It enables you to format a single, large command into a clear, readable vertical list by informing the shell that the command continues on the following line.

# gawk: A robust text processing program (GNU Awk) for extracting and modifying data columns from outputs or text files.

# Sed is a stream editor that can be used to carry out simple text changes on an input stream, such as automating file "search and replace" procedures.

# grep: A command-line tool for looking for particular string patterns or regular expressions in text or files.

# shellcheck: A static analysis tool that looks for probable problems, bad practices, and syntax issues in your shell scripts.

# Security experts and administrators use nmap, a network mapping program, to find devices, open ports, and vulnerabilities on a network.

# Network packet analyzers include tcpdump and tshark. They record and show real-time data packets moving across a network (TShark is Wireshark's command-line counterpart).

# Proxychains4: Tools for routing and privacy. While proxychains4 compels each specific application's network traffic to flow via proxy servers (like Tor), tor directs traffic through the anonymous Tor network.

# jq: A small, command-line utility designed especially for parsing, filtering, and formatting JSON data.

# The built-in manual/documentation pages for other Linux commands can be read using man-db, the database and tools that support the man command.

 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \

# ============= #
#  Section f    #
# ============= #

# This step uncomments and enables the Spanish UTF-8 layout string, which is then compiled by 'locale-gen' to guarantee correct native character support across terminal tools. 
# It uses 'sed -i' to perform in-place stream editing to modify the localization configuration file without creating duplicates (BHB Ch. 2).



 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# ============= #
#  Section g    #
# ============= #

# Cached installer files are purged by running 'apt-get clean' and using 'rm -rf' to remove temporary metadata directories (BHB Ch. 3). 
# Conducting this operational cleanup within the same run block ensures that temporary files are removed before Docker commits and freezes the filesystem layer, thereby preventing image bloat.


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]

# ============= #
#  Section h    #
# ============= #

# The shell command enforces a full Bash environment (“/bin/bash", "-c]) for following run steps by overriding the default system interpreter (/bin/sh). 
# This guarantees that sophisticated script features like arrays, intricate string expansions, and contemporary conditional logic parse consistently 
# rather than relying on constrictive POSIX shell constraints (BHB Ch. 1).


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# ============= #
#  Section i    #
# ============= #

# By integrating with cloud services such as GitHub Codespaces, setting this to /workspaces ensures that fresh terminal sessions open right where our repository files are stored.
# Within the virtual filesystem layout of the container, workdir sets the absolute path and active execution context (BHB Ch. 1).



# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ============= #
#  Section j    #
# ============= #

# This section uses the '--system' flag to apply system-wide environment configurations for Git version control operations. 
# safe.directory '*': Loosens directory ownership restrictions to avoid execution blocks brought on by UID discrepancies between the root environment of the container and the host filesystem.
# pull.rebase false: Set up standard merge behavior as the default integration strategy during repository pull activities. 
# init.defaultBranch main: Enforces 'main' as the default branch name during repository startup to remove terminal warnings.
# git lfs install --system: Enables the system to process binary assets without interruption by hooking the Large File Storage framework globally.


# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.

# Cambiar shell de login de root a zsh dentro de la imagen,
# para que chsh ya no haga falta y todo sea consistente.
RUN chsh -s /usr/bin/zsh root

# ============= #
#  Section k    #
# ============= #

# The default interactive login shell for a particular system user account can be changed using the 'chsh' (change shell) command. 
# The default command-line execution surface is updated to the Z shell by targeting the root user and pointing to '/usr/bin/zsh'. 
# This standardizes the workspace interface to reflect contemporary Kali Linux native setups (BHB Ch. 1).


# Prompt del curso para bash
RUN cat >> /root/.zshrc <<'EOF'

# Validación
PROMPT='%F{cyan}[FrancisAcuña]%f %F{yellow}%1~%f %(?.%F{green}✓.%F{red}✖ %?)%f %# '
EOF

# ============= #
#  Section l    #
# ============= #

# An advanced stream redirection technique called Here-Document (<<'EOF') injects multi-line text blocks straight into files without the need for interactive text editors (BHB Ch. 1).
# By stopping the build shell from prematurely extending variables, single quotes surrounding the 'EOF' delimiter guarantee literal string appending. 
# In order to rapidly track and provide execution exit status codes via visual metrics, the PROMPT configuration modifies the interactive Zsh workspace interface by incorporating a personal identifying signature, the current working directory path (%1~), 
# and a dynamic ternary conditional check. 


CMD ["/bin/zsh"]

# ============= #
#  Section m    #
# ============= #

# When the container instantiates at runtime, the default execution command is specified by CMD. 
# CMD designates the persistent runtime entrypoint and initiates an interactive Z shell session upon startup, in contrast to build-time RUN instructions 
# that carry out actions to permanently modify and compile static filesystem layers (BHB Ch. 3).
