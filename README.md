[![MELPA Stable](http://stable.melpa.org/packages/wn-mode-badge.svg)](http://stable.melpa.org/#/wn-mode) [![MELPA](http://melpa.org/packages/wn-mode-badge.svg)](http://melpa.org/#/wn-mode)

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

By default, the shortcuts are <kbd>M-1</kbd>, ..., <kbd>M-9</kbd> for
selecting windows #1 through #9. <kbd>M-0</kbd> selects the
minibuffer, if active. <kbd>M-#</kbd> interactively asks which window
to select.

With a prefix argument, swaps the buffers between the current and
target windows.

Customize `wn-keybinding-format` if you wish to use different key
bindings, e.g.:

    (setq wn-keybinding-format "C-c %s")

Re-enable `wn-mode` and the new keybindings will take effect.
