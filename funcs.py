import os
import logging
import json

logger = logging.getLogger("RaspberryCast")


def getimages():
    images = {}
    for img in ['processing', 'ready']:
        normal = 'images/' + img + '.jpg'
        override = 'images/overrides/' + img + '.jpg'
        exists = os.path.isfile(override)
        if exists:
            # Override image
            logger.info("Overriding '" + img + "' image with " + override)
            images[img] = override
        else:
            # use standard image
            images[img] = normal
    return images


_funcs_lastOptions = {}
def loadOptions():
    global _funcs_lastOptions
    try:
        with open('config.json') as f:
            options = json.load(f)
    except:
        options = _funcs_lastOptions

    _funcs_lastOptions = options

    return options

def saveOptions(options):
    try:
        with open('config.json', 'w') as f:
            json.dump(options,f)
    except:
        pass
