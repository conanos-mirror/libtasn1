from conans import ConanFile, CMake, tools
from shutil import copyfile
import os

class Libtasn1Conan(ConanFile):
    name = "libtasn1"
    version = "4.13"
    description = "Libtasn1 is the ASN.1 library used by GnuTLS and some other packages"
    url = "https://github.com/conanos/libtasn1"
    homepage = "http://www.gnu.org/software/libtasn1/"
    license = "LGPLv2_1Plus"
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False]}
    default_options = "shared=True"
    generators = "cmake"

    source_subfolder = "source_subfolder"

    def source(self):
        tools.get('http://ftp.gnu.org/gnu/libtasn1/{0}-{1}.tar.gz'.format(self.name, self.version))
        extracted_dir = "%s-%s"%(self.name, self.version)
        os.rename(extracted_dir, self.source_subfolder)

    def build(self):
        with tools.chdir(self.source_subfolder):
            self.run("autoreconf -f -i")

            _args = ["--prefix=%s/builddir"%(os.getcwd()), "--libdir=%s/builddir/lib"%(os.getcwd()),
                     "--disable-doc", "--disable-silent-rules"]
            
            if self.options.shared:
                _args.extend(['--enable-shared=yes','--enable-static=no'])
            else:
                _args.extend(['--enable-shared=no','--enable-static=yes'])
            
            self.run('./configure %s'%(' '.join(_args)))#space
            self.run('make -j4')
            self.run('make install')

    def package(self):
        if tools.os_info.is_linux:
            with tools.chdir(self.source_subfolder):
                self.copy("*", src="%s/builddir"%(os.getcwd()))

    def package_info(self):
        self.cpp_info.libs = tools.collect_libs(self)

