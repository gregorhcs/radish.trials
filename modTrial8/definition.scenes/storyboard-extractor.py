import sys, datetime, yaml, pprint

yamlDoc = {}

with open(sys.argv[1], 'r') as fileHandle:

    yamlDoc = yaml.safe_load(fileHandle.read())

dialogscript = yamlDoc['dialogscript']

del dialogscript['actors']
del dialogscript['player']

storyboardStructure = ''

for sectionName in dialogscript.keys():

    storyboardStructure += '\n\n' + sectionName + ':\n'

    for sectionElement in dialogscript[sectionName]:

        if sectionElement != 'EXIT' and 'CUE' in dict(sectionElement).keys():
            storyboardStructure += '\n\t' + sectionElement['CUE'] + ':\n'
            if 'noret' in sectionElement['CUE']:
                storyboardStructure += '\t\t- cam: [0.0, cam_1_merchant]\n'
            if 'geralt' in sectionElement['CUE']:
                storyboardStructure += '\t\t- cam: [0.0, cam_2_geralt]\n'

with open('storyboard-extractor-output.yml', 'a') as fileHandle:
    fileHandle.writelines('#---- ' + str(datetime.datetime.now()) + ' ----')
    fileHandle.write(storyboardStructure)
