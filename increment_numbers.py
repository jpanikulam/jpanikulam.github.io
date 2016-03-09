import sublime
import sublime_plugin
import string


class IncrementNumbersCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        sels = self.view.sel()
        num = 0
        for sel in sels:
            selected_str = self.view.substr(sel)
            stripped = selected_str.strip()
            if stripped != '':
                incremented = increment(stripped, 1)
                self.view.replace(edit, sel, incremented)
            else:
                self.view.replace(edit, sel, str(num))
                num += 1


class DecrementNumbersCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        sels = self.view.sel()
        num = 0
        alphabet = string.ascii_lowercase
        for sel in sels:
            selected_str = self.view.substr(sel)
            stripped = selected_str.strip()
            if stripped != '':
                incremented = increment(stripped, -1)
                self.view.replace(edit, sel, incremented)
            else:
                self.view.replace(edit, sel, alphabet[num % len(alphabet)])
                num += 1


def increment(selected_str, amount=1):
    if selected_str.isdigit():
        incremented = int(selected_str) + amount
        return str(incremented)
    elif selected_str.isalpha() and (len(selected_str) == 1):
        if selected_str.isupper():
            alphabet = string.ascii_uppercase
        else:
            alphabet = string.ascii_lowercase

        alphabet_index = (alphabet.find(selected_str) + amount) % len(alphabet)
        return alphabet[alphabet_index]
