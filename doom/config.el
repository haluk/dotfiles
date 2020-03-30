;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; UI and Keyboard
;;(setq doom-font (font-spec :family "Fantasque Sans Mono" :size 16))
(setq doom-font (font-spec :family "JetBrains Mono" :size 16))
;;(setq doom-font (font-spec :family "Hasklig" :size 14))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(move-text-default-bindings)
(global-set-key (kbd "C-c d") 'multi-line)

;; Python
(setenv "WORKON_HOME" "/home/hd/.local/share/virtualenvs/")
(add-hook 'before-save-hook 'py-isort-before-save)

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))


;; Latex
(defun my-reftex-formats-hook ()
  (setq reftex-cite-format
    '((97 . "\\autocite[]{%l}")
     (98 . "\\blockcquote[]{%l}{}")
     (99 . "\\cite[]{%l}")
     (102 . "\\footcite[]{%l}")
     (110 . "\\nocite{%l}")
     (112 . "\\parencite[]{%l}")
     (115 . "\\smartcite[]{%l}")
     (116 . "\\textcite[]{%l}")
     (80 . "~\\citep[]{%l}"))))

(add-hook 'reftex-mode-hook 'my-reftex-formats-hook)

;; Other
(setq langtool-language-tool-jar "/home/hd/bin/languagetool-commandline.jar")

;; Misc
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
  This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)
