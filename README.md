[![MELPA](http://melpa.org/packages/wn-mode-badge.svg)](http://melpa.org/#/wn-mode)

wn-mode
-------

This library defines a global minor mode called *wn-mode* that adds
keyboard shortcuts to quickly switch between visible windows within
the current Emacs frame.

Install it via [MELPA](http://melpa.org) with:

    M-x package-install RET wn-mode RET

To activate, simply add

    (wn-mode)

to your `~/.emacs`.

By default, the shortcuts are <kbd>M-1</kbd>, ..., <kbd>M-9</kbd>,
<kbd>M-0</kbd>, <kbd>M-#</kbd>.

Customize `wn-keybinding-format` if you wish to use different key
bindings, e.g.:

    (setq wn-keybinding-format "C-c %s")

Invoke <kbd>M-x remake-wn-mode-map</kbd> if you want it to take effect
immediately.
