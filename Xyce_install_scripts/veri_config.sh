#!/bin/bash

admsXml -x -e $XYCE_ADMSDIR/adms.implicit.xml -e $XYCE_ADMSDIR/xyceVersion_nosac.xml \
           -e $XYCE_ADMSDIR/xyceBasicTemplates_nosac.xml \
           -e $XYCE_ADMSDIR/xyceAnalogFunction_nosac.xml \
           -e $XYCE_ADMSDIR/xyceHeaderFile_nosac.xml\
           -e $XYCE_ADMSDIR/xyceImplementationFile_nosac.xml RLC.va
