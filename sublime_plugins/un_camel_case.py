import sublime
import sublime_plugin

import re

class UnCamelCase(sublime_plugin.TextCommand):
    _first_cap_re = re.compile('(.)([A-Z][a-z]+)')
    _all_cap_re = re.compile('([a-z0-9])([A-Z])')

    def run(self, edit):
        sels = self.view.sel()
        for sel in sels:
            text = self.view.substr(sel)
            new_text = self.convert(text)
            self.view.replace(edit, sel, new_text)

    def convert(self, text):
        s1 = self._first_cap_re.sub(r'\1_\2', text)
        return self._all_cap_re.sub(r'\1_\2', s1).lower()
