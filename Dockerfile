FROM alpine:latest
ARG TEXSCHEME=full

#=============================================================================
# Part 1 - create files
#=============================================================================

RUN echo "==> Creating files"
COPY <<EOF /LICENSE
MIT License

Copyright (c) 2019 Cheng XU
Copyright (c) 2023 Steen Krøyer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

EOF

COPY <<EOF /texlive.profile
# Ref: https://www.tug.org/texlive/doc/install-tl.html

TEXDIR         /opt/texlive/texdir
TEXMFLOCAL     /opt/texlive/texmf-local
TEXMFSYSVAR    /opt/texlive/texdir/texmf-var
TEXMFSYSCONFIG /opt/texlive/texdir/texmf-config
TEXMFVAR       /root/texlive/texmf-var
TEXMFCONFIG    /root/texlive/texmf-config
TEXMFHOME      /root/texmf
binary_x86_64-linuxmusl 1
binary_x86_64-linux 0
instopt_adjustpath 0
instopt_adjustrepo 1
instopt_letter 0
instopt_portable 0
instopt_write18_restricted 0
tlpdbopt_autobackup 0
tlpdbopt_create_formats 1
tlpdbopt_generate_updmap 0
tlpdbopt_install_docfiles 0
tlpdbopt_install_srcfiles 0
tlpdbopt_post_code 1
tlpdbopt_sys_bin /usr/local/bin
tlpdbopt_sys_info /usr/local/share/info
tlpdbopt_sys_man /usr/local/share/man

EOF

COPY <<EOF /texlive_pgp_keys.asc
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
i0qNse4DKMoBZ8s=
=epbb
-----END PGP PUBLIC KEY BLOCK-----

EOF

#=============================================================================
# Part 2 - install system packages
#=============================================================================

RUN echo "==> Install system packages"
RUN apk --no-cache add \
    bash \
    curl \
    fontconfig \
    ghostscript \
    gnupg \
    gnuplot \
    git \
    graphviz \
    inkscape \
    make \
    openjdk17-jre-headless \
    perl \
    perl-unicode-linebreak \
    perl-yaml-tiny \
    py-pygments \
    python3 \
    tar \
    ttf-freefont \
    wget \
    xz
RUN apk --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    add perl-file-homedir clisp 

#=============================================================================
# Part 3 - install TeX Live
#=============================================================================

ENV PATH="/opt/texlive/texdir/bin/x86_64-linuxmusl:${PATH}"

RUN echo "==> Install TeXLive"
WORKDIR /tmp/install-tl
RUN echo -n "$(curl -w "%{redirect_url}" -s -o /dev/null https://mirror.ctan.org/)" > mirror
RUN curl -OL "$(cat mirror)systems/texlive/tlnet/install-tl-unx.tar.gz"
RUN curl -OL "$(cat mirror)systems/texlive/tlnet/install-tl-unx.tar.gz.sha512"
RUN curl -OL "$(cat mirror)systems/texlive/tlnet/install-tl-unx.tar.gz.sha512.asc"
RUN gpg --import /texlive_pgp_keys.asc
RUN gpg --verify ./install-tl-unx.tar.gz.sha512.asc ./install-tl-unx.tar.gz.sha512
RUN sha512sum -c ./install-tl-unx.tar.gz.sha512
RUN mkdir -p /tmp/install-tl/installer
RUN tar --strip-components 1 -zxf /tmp/install-tl/install-tl-unx.tar.gz -C /tmp/install-tl/installer
# Run the TeX Live installer. It's a lot to download and sometimes there's a network hiccup
# during installation, so we'll try up to 3 times to fetch and install the whole shebang
RUN /tmp/install-tl/installer/install-tl -scheme "scheme-${TEXSCHEME}" -profile=/texlive.profile || \
    /tmp/install-tl/installer/install-tl -scheme "scheme-${TEXSCHEME}" -profile=/texlive.profile || \
    /tmp/install-tl/installer/install-tl -scheme "scheme-${TEXSCHEME}" -profile=/texlive.profile

# Install additional packages for non full scheme
RUN if [ "${TEXSCHEME}" != "full" ]; then \
    tlmgr install \
    collection-fontsrecommended \
    collection-fontutils \
    biber \
    biblatex \
    latexmk \
    texliveonfly \
    xindy \
    ;fi

# https://github.com/xu-cheng/latex-action/issues/32#issuecomment-626086551
RUN ln -sf /opt/texlive/texdir/texmf-dist/scripts/xindy/xindy.pl /opt/texlive/texdir/bin/x86_64-linuxmusl/xindy
RUN ln -sf /opt/texlive/texdir/texmf-dist/scripts/xindy/texindy.pl /opt/texlive/texdir/bin/x86_64-linuxmusl/texindy
RUN curl -OL https://sourceforge.net/projects/xindy/files/xindy-source-components/2.4/xindy-kernel-3.0.tar.gz
RUN tar xf xindy-kernel-3.0.tar.gz
WORKDIR /tmp/install-tl/xindy-kernel-3.0/src
RUN make
RUN cp -f xindy.mem /opt/texlive/texdir/bin/x86_64-linuxmusl/

# System font configuration for XeTeX and LuaTeX
# Ref: https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-330003.4.4
RUN ln -s /opt/texlive/texdir/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
RUN fc-cache -fv

#=============================================================================
# Part 4 - cleanup to make image smaller
#=============================================================================

WORKDIR /
RUN echo "==> Clean up"
RUN rm -rf \
    /opt/texlive/texdir/install-tl \
    /opt/texlive/texdir/install-tl.log \
    /opt/texlive/texdir/texmf-dist/doc \
    /opt/texlive/texdir/texmf-dist/source \
    /opt/texlive/texdir/texmf-var/web2c/tlmgr.log \
    /texlive.profile \
    /texlive_pgp_keys.asc \
    /tmp/install-tl

CMD ["/bin/bash"]
