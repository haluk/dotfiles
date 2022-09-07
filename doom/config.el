;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Haluk Dogan"
      user-mail-address "hdogan@vivaldi.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Roboto Mono" :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "monospace" :size 11 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-oceanic-next)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Editor
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (pixel-scroll-precision-mode)
                                        ; ace-window font face
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5 :box (:line-width 10 :color "red")))
(global-set-key (kbd "C-c b") 'bool-flip-do-flip)
                                        ; modeline
(setq doom-modeline-modal-icon nil)
(setq all-the-icons-scale-factor 1.1)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-env-enable-python nil)
                                        ; follow links
(define-key evil-normal-state-map (kbd "SPC l o") 'link-hint-open-link)
(define-key evil-normal-state-map (kbd "SPC l c") 'link-hint-copy-link)
                                        ; dirvish
(set-face-attribute 'ansi-color-blue nil :foreground "#FFFFFF")
;; Treemacs
(setq doom-themes-treemacs-enable-variable-pitch nil)

;; Email
; use msmtp
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp")
; tell msmtp to choose the SMTP server according to the from field in the outgoing email
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-sendmail-f-is-evil 't)
; notmuch
(after! notmuch (set-popup-rule! "^\\*notmuch-hello" :ignore t))

;; RSS
(after! elfeed
  (setq elfeed-search-filter "@2-weeks-ago +unread")
  (setq elfeed-sort-order 'descending)
  (setq elfeed-search-title-max-width 100)
  (setq elfeed-search-title-min-width 30)
  (setq elfeed-search-trailing-width 25)
  (setq elfeed-show-truncate-long-urls t)
  (setq elfeed-goodies/entry-pane-position 'bottom))
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

;; lsp-mode
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-doc-enabled nil)
(setq lsp-ui-imenu-enable 't)
(setq lsp-ui-imenu-auto-refresh 't)
(setq lsp-ui-imenu--custom-mode-line-format "")

(setq lsp-auto-guess-root t)
(setq lsp-log-io nil)
(setq lsp-restart 'auto-restart)
(setq lsp-enable-on-type-formatting nil)
(setq lsp-signature-auto-activate nil)
(setq lsp-signature-render-documentation nil)
(setq lsp-eldoc-hook nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-modeline-diagnostics-enable nil)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-semantic-tokens-enable nil)
(setq lsp-enable-folding nil)
(setq lsp-enable-imenu nil)
(setq lsp-enable-snippet nil)
(setq read-process-output-max (* 1024 1024)) ;; 1MB
(setq lsp-idle-delay 0.5)

;; pdftools
(setq +latex-viewers '(pdf-tools))

;; Company backends
(add-to-list '+lsp-company-backends 'company-files)

;; PL
; Python
(setenv "WORKON_HOME" "~/.pyenv/versions")
(setq lsp-pylsp-plugins-jedi-use-pyenv-environment t)

; TeX
(after! tex
  (remove-hook 'TeX-update-style-hook #'rainbow-delimiters-mode))

; Org
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (http . t)))

(add-to-list 'org-latex-packages-alist '("ruled,vlined" "algorithm2e"))

; SQL
(defun remove-trailing-newline (point)
  (if (= (char-before point) ?\n)
      (- point 1)
    point))

(defun sql-format (start end)
  "Formats the selected sql `sqlformat'"
  (interactive "r")
  (shell-command-on-region
   ;; beginning and end of buffer
   start
   (remove-trailing-newline end)
   ;; command and parameters
   "sqlformat -k upper -r -s -a --indent_columns -"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Sqlformat Error Buffer*"
   ;; show error buffer?
   t))
