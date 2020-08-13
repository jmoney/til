#!/usr/local/bin/python3

import glob
import os
import json
import re

regex = re.compile('\d{2}_\d{2}_\d{4}')

def format_filename(filename):
    match = re.match(regex, filename)
    if match:
        return os.path.splitext(filename)[0].replace("_", "/")    
    return os.path.splitext(filename)[0].replace("-", " ")

def format_capital_filename(filename):
    return format_filename(filename).capitalize()

def format_title_filename(filename):
    return format_filename(filename).title()

def build_markdown_file(markdown):
    markdown_item = dict()

    markdown_file = dict()
    markdown_file["capital_filename"] = format_capital_filename(os.path.basename(markdown))
    markdown_file["fullpath"] = markdown

    markdown_item[format_title_filename(os.path.basename(markdown))] = markdown_file
    return markdown_item

if __name__ == '__main__':
    markdowns = dict()

    for markdown in glob.glob("./markdown/**/*.md", recursive=True):
        basepath = os.path.basename(os.path.dirname(markdown))
        if basepath not in markdowns:
            markdowns[basepath] = dict()

        markdowns[basepath].update(build_markdown_file(markdown))

    print(json.dumps(markdowns, sort_keys=True, indent=4))