import os
import argparse
import csv
import string
from collections import namedtuple

from termcolor import cprint, colored


parser = argparse.ArgumentParser(description='Generate panel labels')
parser.add_argument('template', type=str,
                    help='Panel label template file')
parser.add_argument('prodlist', type=str,
                    help='Production list csv')
parser.add_argument('outputdir', type=str,
                    help='Output directory')

ProdListEntry = namedtuple('ProdListEntry', ['sn', 'aircraft_id', 'hw_ver'])

def parse_prod_list(prodlist_fname):
    with open(prodlist_fname, 'r') as f:
        reader = csv.reader(f)
        # Skip headers
        next(reader)

        for line in reader:
            yield ProdListEntry(*line[:3])

    return []


def render_labels(entry, template, outputdir):
    # Find template for the hw version
    tfilename = template % entry.hw_ver
    if not os.path.exists(tfilename):
        cprint("Warning: no template for version %s: %s" % (entry.hw_ver, tfilename), 'red')
        return

    with open(tfilename) as f:
        tpl = string.Template(f.read())

    paddedsn = "%05d" % int(entry.sn)
    data = {
        'sn': paddedsn,
        'aid': entry.aircraft_id,
        'hwv': entry.hw_ver
    }
    label_content = tpl.safe_substitute(data)

    tfilebase = os.path.basename(tfilename)
    outfname = os.path.join(outputdir, f"{paddedsn}-{tfilebase}")
    with open(outfname, 'w') as f:
        f.write(label_content)
    cprint(f"Written: {outfname}", "green")


def main():
    args = parser.parse_args()
    prod_list = parse_prod_list(args.prodlist)

    cprint("Generating box labels", "blue")

    for entry in prod_list:
        render_labels(entry, args.template, args.outputdir)
    pass

    cprint("Done.", "blue")


if __name__ == '__main__':
    main()
