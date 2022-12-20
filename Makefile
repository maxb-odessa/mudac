
PREFIX		=	${HOME}/.local
SHAREDIR	=	${PREFIX}/share/mudac
CONFDIR		=	${PREFIX}/etc
GOBIN		=	${PREFIX}/bin

GO111MODULE	=	auto

CC			=	gcc

all: build

build:
	go build ./cmd/mudac

install:
	go env -w GOBIN=${GOBIN}
	go install ./cmd/mudac
	mkdir -p ${SHAREDIR} && \
	cp -f scripts/* ${SHAREDIR} && \
	mkdir -p ${CONFDIR} && \
	cp -f etc/mudac.conf ${CONFDIR} && \
	sed -i "s=@SHAREDIR@=${SHAREDIR}=g" ${CONFDIR}/mudac.conf && \
	echo INSTALLED

