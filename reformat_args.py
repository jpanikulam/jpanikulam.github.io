import sublime
import sublime_plugin


class ReformatArgs(sublime_plugin.TextCommand):
    def run(self, edit):
        # self.view.insert(edit, 0, "Hello, World!")
        sels = self.view.sel()

        for sel in sels:
            selected_str = self.view.substr(sel)

            if ',' not in selected_str:
                continue

            line = self.view.substr(self.view.line(sel))
            num_spaces = len(line) - len(line.lstrip())

            restringed = self.restring(selected_str, num_spaces)
            self.view.replace(edit, sel, restringed)
            # print(restringed)

    def restring(self, text, num_spaces):
        spaces = num_spaces * ' '
        padding = 4 * ' ' + spaces

        depth = 0
        out_str = "\n" + padding
        for char_num, character in enumerate(text):
            chars_left = len(text) - 1 - char_num

            # Depth is how many parenthizations deep we are
            if character in '([{':
                depth += 1

            if character in '}])':
                depth -= 1

            # Scrub spaces
            if character != ' ' or depth > 0:
                out_str += character

            # --> If there's a comma
            # --> And we're not inside of a parenthization
            # --> And this isn't a comma at the end of the string
            # : Add a newline
            if character == ',' and depth == 0 and chars_left > 0:
                out_str += '\n' + padding

        out_str += '\n' + spaces
        return out_str
