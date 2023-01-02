#!/usr/bin/env python3

import os
import shutil

# Directory containing the files to be renamed and moved
source_dir = '/home/nelk/Dropbox/notes_alex_klen/ingest'

# Directory to move the files to
target_dir = '/home/nelk/Dropbox/notes_alex_klen/assets'

# File to append the markdown links to
markdown_file = '/home/nelk/Dropbox/notes_alex_klen/pages/Reading List.md'

# Iterate through all files in the source directory
for file in os.listdir(source_dir):
  # Construct the source and target file paths
  file_name = file.replace(' ', '_')
  source_path = os.path.join(source_dir, file)
  target_path = os.path.join(target_dir, file_name)
  target_rel_path = os.path.join('..', 'assets', file_name)
  
  # Move the file to the target directory
  print(f'Moving "{source_path}" to "{target_path}"')
  shutil.move(source_path, target_path)
  
  # Append the markdown link to the markdown file
  with open(markdown_file, 'a') as f:
    f.write(f'\n\t- ![{file_name}]({target_rel_path})')

print('Done!')

