;;; wn-model.el -- numeric window switching shortcuts -*- lexical-binding: t -*-

;; This library was found at the Emacs Wiki and is probably in the
;; public domain.

;; Author: Anonymous
;; Maintainer: Luís Oliveira <luismbo@gmail.com>
;; Keywords: buffers windows switching-windows

;;; Commentary:

;; This library defines a global minor mode called `wn-mode' that adds
;; keyboard shortcuts to quickly switch between visible windows within
;; the current Emacs frame.
;;
;; To activate, simply add
;;   (wn-mode)
;; to your `~/.emacs'.
;;
;; By default the shortcuts are M-0, M-1, ..., M-9, M-#.
;;
;; Customize `wn-keybinding-format' if you wish to use different key
;; bindings, e.g.:
;;   (setq wn-keybinding-format "C-c %s")
;;
;; Invoke M-x remake-wn-mode-map if you want it to take effect
;; immediately.

;;; Code:

(defun wn--window-list ()
  "Return a list of ordered windows on the current frame."
  (window-list (selected-frame) 0 (minibuffer-window)))

;;;###autoload
(defun wn-select-nth (n)
  "Select window number N in current frame."
  (interactive "nWindow number: ")
  (let ((window (nth (1- n) (wn--window-list))))
    (if window
        (select-window window)
        (message "No such window."))))

(defun wn--selected-window-number ()
  "Return the number of the selected window"
  ;; this strange implementation avoids a dependency on cl-position!
  (length (memq (selected-window) (reverse (wn--window-list)))))

(defun wn--selected-window-modeline ()
  "Return the string for the current window modeline."
  (propertize (format " #%s" (wn--selected-window-number))
              'face 'wn-modeline-face))

(defvar wn-keybinding-format "M-%s"
  "Define how the numeric keybindings should be set up.

By default we use M-0, M-1, ..., M-9, M-# which has the advantage of being
convenient but overrides built-in Emacs keybindings.")

(defun make-wn-mode-map ()
  (let ((map (make-sparse-keymap)))
    (dotimes (i 10)
      (define-key map (kbd (format wn-keybinding-format i))
        (let ((n (nth i '(10 1 2 3 4 5 6 7 8 9))))
          (lambda () (interactive) (wn-select-nth n)))))
    (define-key map (kbd (format wn-keybinding-format "#"))
      'wn-select-nth)
    map))

(defvar wn-mode-map (make-wn-mode-map)
  "wn-mode's keymap.")

;;;###autoload
(defun remake-wn-mode-map ()
  "Updates wn-mode-map and reloads wn-mode when it's active."
  (interactive)
  (let ((reactivate-wn-mode wn-mode))
    (when wn-mode
      (wn-mode 0))
    (setq wn-mode-map (make-wn-mode-map))
    (when reactivate-wn-mode
      (wn-mode 1))))

;;;###autoload
(define-minor-mode wn-mode
  "A minor mode that enables quick selection of windows."
  :group 'windows
  :global t
  :init-value nil
  :lighter (:eval (wn--selected-window-modeline)))

(defface wn-modeline-face
  '((t nil))
  "wn-mode modeline face.")

(provide 'wn-mode)

;;; wn-mode.el ends here
