from re import match, search, sub
from vim import eval, current

def preceding_space_count(str):
    """
    Gets the number of spaces which precede non-whitespace text in a line.
    """
    matches = search(r'[^\s]', str)
    if matches:
        return matches.start(0)
    else:
        return 0

def comment_code():
    """
    Comments or uncomments the current range of lines.
    """
    # Get the comment string
    comment_string = filter(bool, eval('&cms').split('%s'))[0] + ' '
    if comment_string == '/* ':
        comment_string = '// '

    # Get current selection
    selection = current.range

    # See if any lines are both uncommented and not empty
    insert_comments = any(map(
            lambda x: not match(r'^\s*'+comment_string, x) and bool(x.strip()),
            selection,
            ))

    if insert_comments:
        # Get number of preceding spaces before leftmost text in selection
        non_blank_lines = filter(lambda x: bool(x.strip()), selection)
        space_count = min(map(preceding_space_count, non_blank_lines))

        for i, line in enumerate(selection):
            if line.strip() == '':
                # If empty, set to blank
                selection[i] = ''
            else:
                # Otherwise, insert comment string
                selection[i] = sub(
                        r'^(\s{%d})' % space_count,
                        r'\1%s' % comment_string,
                        line,
                        )
    else:
        for i, line in enumerate(selection):
            if line.strip() == '':
                # If empty, set to blank
                selection[i] = ''
            else:
                # Otherwise, clip out comment string
                selection[i] = sub(
                        r'^(\s*)%s' % comment_string,
                        r'\1',
                        line,
                        )
