import os


def getimages():
    images = {}
    for img in ['processing', 'ready']:
        normal = 'images/' + img + '.jpg'
        override = 'images/overrides/' + img + '.jpg'
        exists = os.path.isfile(override)
        if exists:
            # Override image
            images[img] = override
        else:
            # use standard image
            images[img] = normal
    return images
