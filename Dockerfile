## docker file for Manta:  https://github.com/Illumina/manta with bcftools as a utility
## fredhutch/manta:1.6.0
FROM fredhutch/bcftools:1.9

RUN apt-get update -y && apt-get install -y curl build-essential bzip2 gcc g++ make python zlib1g-dev wget

RUN wget https://github.com/Illumina/manta/releases/download/v1.6.0/manta-1.6.0.release_src.tar.bz2

RUN tar jxf manta-1.6.0.release_src.tar.bz2 && \
	rm manta-1.6.0.release_src.tar.bz2 && \
	mkdir build 

WORKDIR /build
RUN ../manta-1.6.0.release_src/configure --jobs=4 && make -j4 install

WORKDIR /

RUN rm -rf manta-1.6.0.release_src
