QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

#------------------------------- Versioning

VERSION_MAJOR = 0
VERSION_MINOR = 1
VERSION_BUILD = 6

DEFINES += "VERSION_MAJOR=$$VERSION_MAJOR"\
           "VERSION_MINOR=$$VERSION_MINOR"\
           "VERSION_BUILD=$$VERSION_BUILD"

VERSION = $${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_BUILD}

#-------------------------------

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    src/channelselectentity.cpp \
    src/checkboxentity.cpp \
    src/colorbutton.cpp \
    src/colorbuttonentity.cpp \
    src/colorpropertiesentity.cpp \
    src/comboboxentity.cpp \
    src/connection.cpp \
    src/csimage.cpp \
    src/csmessagebox.cpp \
    src/cssettingsbuffer.cpp \
    src/csslider.cpp \
    src/cssliderbox.cpp \
    src/fileboxentity.cpp \
    src/folderboxentity.cpp \
    src/gmic/FilterTextTranslator.cpp \
    src/gmic/FiltersModel.cpp \
    src/gmic/FiltersModelReader.cpp \
    src/gmic/FiltersVisibilityMap.cpp \
    src/gmic/Globals.cpp \
    src/gmic/GmicStdlib.cpp \
    src/gmic/HtmlTranslator.cpp \
    src/gmic/InputOutputState.cpp \
    src/gmic/ParametersCache.cpp \
    src/gmic/Utils.cpp \
    src/gmichelper.cpp \
    src/gmicpropertiesentity.cpp \
    src/lineeditentity.cpp \
    src/main.cpp \
    src/mainwindow.cpp \
    src/nodebase.cpp \
    src/nodegraph.cpp \
    src/nodegraphcontextmenu.cpp \
    src/nodeinput.cpp \
    src/nodeoutput.cpp \
    src/nodeproperties.cpp \
    src/propertiesheading.cpp \
    src/propertiesview.cpp \
    src/rendermanager.cpp \
    src/separatorentity.cpp \
    src/sizeboxentity.cpp \
    src/slidernoclick.cpp \
    src/spinboxentity.cpp \
    src/textboxentity.cpp \
    src/textbrowserentity.cpp \
    src/uientity.cpp \
    src/viewerstatusbar.cpp \
    src/vulkanrenderer.cpp \
    src/vulkanview.cpp \
    src/vulkanwindow.cpp \
    src/windowmanager.cpp \
    src/writepropertiesentity.cpp

HEADERS += \
    src/benchmark.h \
    src/channelselectentity.h \
    src/checkboxentity.h \
    src/colorbutton.h \
    src/colorbuttonentity.h \
    src/colorpropertiesentity.h \
    src/comboboxentity.h \
    src/connection.h \
    src/csimage.h \
    src/csmessagebox.h \
    src/cssettingsbuffer.h \
    src/csslider.h \
    src/cssliderbox.h \
    src/fileboxentity.h \
    src/folderboxentity.h \
    src/gmic/FilterTextTranslator.h \
    src/gmic/FiltersModel.h \
    src/gmic/FiltersModelReader.h \
    src/gmic/FiltersVisibilityMap.h \
    src/gmic/Globals.h \
    src/gmic/GmicDefinitions.h \
    src/gmic/GmicStdlib.h \
    src/gmic/HtmlTranslator.h \
    src/gmic/InputOutputState.h \
    src/gmic/ParametersCache.h \
    src/gmic/Utils.h \
    src/gmichelper.h \
    src/gmicpropertiesentity.h \
    src/lineeditentity.h \
    src/mainwindow.h \
    src/multithreading.h \
    src/nodebase.h \
    src/nodedefinitions.h \
    src/nodegraph.h \
    src/nodegraphcontextmenu.h \
    src/nodeinput.h \
    src/nodeoutput.h \
    src/nodeproperties.h \
    src/propertiesheading.h \
    src/propertiesview.h \
    src/rendermanager.h \
    src/separatorentity.h \
    src/sizeboxentity.h \
    src/slidernoclick.h \
    src/spinboxentity.h \
    src/textboxentity.h \
    src/textbrowserentity.h \
    src/uicolors.h \
    src/uientity.h \
    src/viewerstatusbar.h \
    src/vulkanrenderer.h \
    src/vulkanview.h \
    src/vulkanwindow.h \
    src/windowmanager.h \
    src/writepropertiesentity.h

FORMS += \
    src/channelselectentity.ui \
    src/checkboxentity.ui \
    src/colorbuttonentity.ui \
    src/colorpropertiesentity.ui \
    src/comboboxentity.ui \
    src/cssliderbox.ui \
    src/fileboxentity.ui \
    src/folderboxentity.ui \
    src/gmicpropertiesentity.ui \
    src/lineeditentity.ui \
    src/mainwindow.ui \
    src/nodebase.ui \
    src/propertiesheading.ui \
    src/separatorentity.ui \
    src/sizeboxentity.ui \
    src/spinboxentity.ui \
    src/textboxentity.ui \
    src/textbrowserentity.ui \
    src/viewerstatusbar.ui \
    src/writepropertiesentity.ui

linux-g++ {
    LIBS += -L /usr/lib -lOpenImageIO
    LIBS += -L /usr/lib -lOpenColorIO
    LIBS += -L /usr/lib -lqtadvanceddocking
    LIBS += -L /usr/lib -lgmic
    LIBS += -L /usr/lib -ltbb

    CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD
    CONFIG(release, debug|release): DESTDIR = $$OUT_PWD

    COPIES += ocio
    ocio.files += $$files(ocio/config.ocio)
    ocio.path = $$DESTDIR/ocio

    COPIES += luts
    luts.files += $$files(ocio/luts/*)
    luts.path = $$DESTDIR/ocio/luts
}

win32-g++ {
    DEPENDENCY_ROOT = C:/msys64/mingw64
    QT_ROOT = C:/msys64/home/till/qt515/5.15.1/mingw81_64
    TEMP_ROOT = C:/msys64/home/till/temp

    LIBS += -L$$DEPENDENCY_ROOT/lib -llibOpenImageIO.dll
    LIBS += -L$$DEPENDENCY_ROOT/lib -llibOpenColorIO.dll
    LIBS += -L$$DEPENDENCY_ROOT/lib -llibqtadvanceddocking
    LIBS += -L$$DEPENDENCY_ROOT/lib -llibgmic.dll
    LIBS += -L$$DEPENDENCY_ROOT/lib -llibtbb.dll

    INCLUDEPATH += $$DEPENDENCY_ROOT/include

    CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD/debug
    CONFIG(release, debug|release): DESTDIR = $$OUT_PWD/release

    COPIES += ocio
    ocio.files += $$files(ocio/config.ocio)
    ocio.path = $$DESTDIR/ocio

    COPIES += luts
    luts.files += $$files(ocio/luts/*)
    luts.path = $$DESTDIR/ocio/luts

    COPIES += license
    license.files += $$files(LICENSE)
    license.path = $$DESTDIR

    COPIES += platforms
    platforms.files += $$files($$QT_ROOT/plugins/platforms/qdirect2d.dll)
    platforms.files += $$files($$QT_ROOT/plugins/platforms/qminimal.dll)
    platforms.files += $$files($$QT_ROOT/plugins/platforms/qoffscreen.dll)
    platforms.files += $$files($$QT_ROOT/plugins/platforms/qwindows.dll)
    platforms.path = $$DESTDIR/platforms

    COPIES += iconengines
    iconengines.files += $$files($$QT_ROOT/plugins/iconengines/qsvgicon.dll)
    iconengines.path = $$DESTDIR/iconengines

    COPIES += styles
    styles.files += $$files($$QT_ROOT/plugins/styles/qwindowsvistastyle.dll)
    styles.path = $$DESTDIR/styles

    COPIES += dlls
    dlls.files += $$files($$QT_ROOT/bin/Qt5Svg.dll)
    dlls.files += $$files($$QT_ROOT/bin/Qt5Widgets.dll)
    dlls.files += $$files($$QT_ROOT/bin/Qt5Gui.dll)
    dlls.files += $$files($$QT_ROOT/bin/Qt5Core.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libOpenImageIO.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libOpenImageIO_Util.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libOpenColorIO.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libboost_filesystem-mt.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libboost_system-mt.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libboost_thread-mt.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libboost_chrono-mt.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libboost_date_time-mt.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libzlib1.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libjpeg62.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/liblibpng16.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libIlmImf-2_5.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libImath-2_5.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libIex-2_5.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libHalf-2_5.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libIlmThread-2_5.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libtiff-5.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/liblzma.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libyaml-cpp.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/tbb.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libgmic.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libgcc_s_seh-1.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libstdc++-6.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libtinyxml-0.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libwinpthread-1.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libfftw3-3.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libGraphicsMagick++-12.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libGraphicsMagick-3.dll)
    dlls.files += $$files($$TEMP_ROOT/libopencv_core440.dll)
    dlls.files += $$files($$TEMP_ROOT/libopencv_videoio440.dll)
    dlls.files += $$files($$TEMP_ROOT/libopencv_imgproc440.dll)
    dlls.files += $$files($$TEMP_ROOT/libopencv_imgcodecs440.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libgomp-1.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libcurl-4.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libjpeg-8.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libpng16-16.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/zlib1.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/libharfbuzz-0.dll)
    dlls.files += $$files($$DEPENDENCY_ROOT/bin/qtadvanceddocking.dll)
    dlls.path = $$DESTDIR
}

win32-msvc* {
    VCPKG_INSTALL_PATH = "C:/Users/ryzen/vcpkg"
    QT_INSTALL_PATH = "C:/Qt515/5.15.1"
    MSVC_INSTALL_PATH = "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.27.29110/bin/Hostx64/x64"

    INCLUDEPATH += $$VCPKG_INSTALL_PATH/installed/x64-windows/include
    INCLUDEPATH += ../external/qtadvanceddocking/src
    INCLUDEPATH += ../external/gmic/include

    CONFIG(release, debug|release) {
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/lib -lOpenImageIO
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/lib -lOpenColorIO
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/lib -ltbb
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/lib -llibpng16
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/lib -lzlib
        LIBS += -L../external/qtadvanceddocking/build/lib -lqtadvanceddocking
        LIBS += -L../external/gmic/lib -lgmic
    }
    CONFIG(debug, debug|release) {
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/debug/lib -lOpenImageIO
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/debug/lib -lOpenColorIO
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/debug/lib -ltbb_debug
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/debug/lib -llibpng16d
        LIBS += -L$$VCPKG_INSTALL_PATH/installed/x64-windows/debug/lib -lzlibd
        LIBS += -L../external/qtadvanceddocking/build/lib -lqtadvanceddockingd
        LIBS += -L../external/gmic/debug/lib -lgmic
    }

    CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD/debug
    CONFIG(release, debug|release): DESTDIR = $$OUT_PWD/release

    COPIES += dlls
    dlls.files += $$files($$MSVC_INSTALL_PATH/vcruntime140.dll)
    dlls.files += $$files($$MSVC_INSTALL_PATH/vcruntime140_1.dll)
    dlls.files += $$files($$MSVC_INSTALL_PATH/msvcp140.dll)
    dlls.files += $$files($$MSVC_INSTALL_PATH/concrt140.dll)
    dlls.files += $$files($$MSVC_INSTALL_PATH/msvcp140_1.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/opengl32sw.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Svg.dll)

    CONFIG(release, debug|release) {
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/OpenImageIO.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/OpenImageIO_Util.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/OpenColorIO.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Widgets.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Gui.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Core.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/boost_filesystem-vc142-mt-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/boost_system-vc142-mt-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/boost_thread-vc142-mt-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/boost_chrono-vc142-mt-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/boost_date_time-vc142-mt-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/zlib1.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/jpeg62.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/libpng16.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/IlmImf-2_5.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/Imath-2_5.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/Iex-2_5.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/Half-2_5.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/IlmThread-2_5.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/tiff.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/lzma.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/yaml-cpp.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/bin/tbb.dll)
    dlls.files += $$files($$DESTDIR/../../external/qtadvanceddocking/build/lib/qtadvanceddocking.dll)
    }

    CONFIG(debug, debug|release) {
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/OpenImageIO.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/OpenImageIO_Util.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/OpenColorIO.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Widgetsd.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Guid.dll)
    dlls.files += $$files($$QT_INSTALL_PATH/msvc2019_64/bin/Qt5Cored.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/boost_filesystem-vc142-mt-gd-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/boost_system-vc142-mt-gd-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/boost_thread-vc142-mt-gd-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/boost_chrono-vc142-mt-gd-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/boost_date_time-vc142-mt-gd-x64-1_74.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/zlibd1.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/jpeg62.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/libpng16d.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/IlmImf-2_5_d.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/Imath-2_5_d.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/Iex-2_5_d.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/Half-2_5_d.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/IlmThread-2_5_d.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/tiffd.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/lzmad.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/yaml-cpp.dll)
    dlls.files += $$files($$VCPKG_INSTALL_PATH/installed/x64-windows/debug/bin/tbb_debug.dll)
    dlls.files += $$files($$DESTDIR/../../external/qtadvanceddocking/build/lib/qtadvanceddockingd.dll)
    }
    dlls.path = $$DESTDIR

    CONFIG(release, debug|release) {
    COPIES += platforms
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qdirect2d.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qminimal.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qoffscreen.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qwebgl.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qwindows.dll)
    platforms.path = $$DESTDIR/platforms

    COPIES += iconengines
    iconengines.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/iconengines/qsvgicon.dll)
    iconengines.path = $$DESTDIR/iconengines

    COPIES += styles
    styles.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/styles/qwindowsvistastyle.dll)
    styles.path = $$DESTDIR/styles
    }

    CONFIG(debug, debug|release) {
    COPIES += platforms
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qdirect2dd.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qminimald.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qoffscreend.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qwebgld.dll)
    platforms.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/platforms/qwindowsd.dll)
    platforms.path = $$DESTDIR/platforms

    COPIES += iconengines
    iconengines.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/iconengines/qsvgicond.dll)
    iconengines.path = $$DESTDIR\iconengines

    COPIES += styles
    styles.files += $$files($$QT_INSTALL_PATH/msvc2019_64/plugins/styles/qwindowsvistastyled.dll)
    styles.path = $$DESTDIR/styles
    }

    COPIES += ocio
    ocio.files += $$files($$DESTDIR/../../ocio/config.ocio)
    ocio.path = $$DESTDIR/ocio

    COPIES += luts
    luts.files += $$files($$DESTDIR/../../ocio/luts/*)
    luts.path = $$DESTDIR/ocio/luts

    COPIES += license
    license.files += $$files($$DESTDIR/../../LICENSE)
    license.path = $$DESTDIR

    #COPIES += plugins
    #plugins.files += $$files($$DESTDIR/../../plugins/ofx)
    #plugins.path = $$DESTDIR/plugins

    INSTALLS += plugins
}

RESOURCES += \
    resources.qrc

DISTFILES += \
    style/stylesheet.qss

