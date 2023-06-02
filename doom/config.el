;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Haluk Dogan"
      user-mail-address "hdogan@vivaldi.net")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Roboto Mono" :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Editor
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; ace-window font face
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5 :box (:line-width 10 :color "red")))
(global-set-key (kbd "C-c b") 'bool-flip-do-flip)
; modeline
(setq doom-modeline-modal-icon nil)
(setq all-the-icons-scale-factor 1.1)
;; (setq doom-modeline-enable-word-count nil)
(setq doom-modeline-env-enable-python nil)
; follow links
(define-key evil-normal-state-map (kbd "SPC l o") 'link-hint-open-link)
(define-key evil-normal-state-map (kbd "SPC l c") 'link-hint-copy-link)
; dirvish
;(set-face-attribute 'ansi-color-blue nil :foreground "#FFFFFF")
;; Treemacs
(setq doom-themes-treemacs-enable-variable-pitch nil)
(global-set-key (kbd "C-c 0") 'treemacs-select-window)
;; indent guides
(setq highlight-indent-guides-responsive 'top)

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

;; Paste image to orgmode https://stackoverflow.com/questions/17435995/paste-an-image-on-clipboard-to-emacs-org-mode-file-without-saving-it
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
                                        ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
                                        ; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]"))))
