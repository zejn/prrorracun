import tempfile
import os

def __convert(pdfdata, get_cmd):
    pdffout = tempfile.NamedTemporaryFile(suffix='.pdf')
    pdffout.write(pdfdata)
    pdffout.flush()

    xmlin = tempfile.NamedTemporaryFile(mode='r', suffix='.xml')
    tmpxml = xmlin.name

    
    cmd = get_cmd(pdffout.name, tmpxml)
    #print 'EXECUTING', cmd
    os.system(cmd)
    
    pdffout.close()
    #xmlfin = open(tmpxml)
    xmldata = xmlin.read()
    xmlin.close()
    return xmldata

def pdf2xml(pdfdata):
    
    def get_cmd(infile, outfile):
        return '/usr/local/bin/pdf2xml "%s" > "%s"' % (infile, outfile)
    
    return __convert(pdfdata, get_cmd)

def pdftoxml(pdfdata):
    def get_cmd(infile, outfile):
        return '/usr/bin/pdftohtml -xml -nodrm -zoom 1.5 -enc UTF-8 -noframes "%s" "%s"' % (infile, os.path.splitext(outfile)[0])
    return __convert(pdfdata, get_cmd)

