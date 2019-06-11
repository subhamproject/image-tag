#!/usr/bin/python
import xml.etree.ElementTree as ElementTree
doc = ElementTree.parse('../../pom.xml')
print(doc.find('{http://maven.apache.org/POM/4.0.0}version').text)
