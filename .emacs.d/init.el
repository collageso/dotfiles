;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Minimal Emacs configuration designed for:
;;
;; - Evil/Vim-style editing
;; - terminal Emacs inside tmux
;; - tmux prefix C-a
;; - vim-tmux-navigator using C-h/j/k/l
;; - minimal external packages
;; - built-in project.el, eglot, dired and compile
;;
;; Emacs window movement:
;;
;;   SPC w h    move left
;;   SPC w j    move down
;;   SPC w k    move up
;;   SPC w l    move right
;;
;; tmux pane movement:
;;
;;   C-h        tmux pane left
;;   C-j        tmux pane down
;;   C-k        tmux pane up
;;   C-l        tmux pane right
;;
;; Since tmux uses C-a as its prefix, send a literal C-a to Emacs with:
;;
;;   C-a C-a

;;; Code:

;; ---------------------------------------------------------------------------
;; Basic paths
;; ---------------------------------------------------------------------------

(setq custom-file
      (expand-file-name ".emacs.custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))


;; ---------------------------------------------------------------------------
;; Package management
;; ---------------------------------------------------------------------------

(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

;; Prefer the more conservative GNU and NonGNU repositories.
(setq package-archive-priorities
      '(("gnu"    . 30)
        ("nongnu" . 20)
        ("melpa"  . 10)))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Packages are installed only when :ensure t is explicitly specified.
(setq use-package-always-ensure nil)

;; Keep package configuration output quiet.
(setq use-package-verbose nil)


;; ---------------------------------------------------------------------------
;; Startup
;; ---------------------------------------------------------------------------

(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Start in the home directory rather than an arbitrary process directory.
(setq default-directory (expand-file-name "~/"))

;; Do not show the native compilation warning buffer automatically.
(setq native-comp-async-report-warnings-errors 'silent)


;; ---------------------------------------------------------------------------
;; User interface
;; ---------------------------------------------------------------------------

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq visible-bell t)
(setq ring-bell-function #'ignore)

(column-number-mode 1)
(size-indication-mode 1)

;; Keep the mode line informative without adding another UI framework.
(setq line-number-mode t)
(setq column-number-mode t)

;; Relative line numbers are useful in Evil normal state.
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Disable line numbers in buffers where they are mostly noise.
(dolist (mode '(term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                eshell-mode-hook
                dired-mode-hook
                help-mode-hook
                compilation-mode-hook
                special-mode-hook))
  (add-hook mode
            (lambda ()
              (display-line-numbers-mode -1))))


;; ---------------------------------------------------------------------------
;; Font
;; ---------------------------------------------------------------------------

(defun my/apply-font ()
  "Apply the preferred font when it is available."
  (when (find-font (font-spec :family "IosevkaTerm Nerd Font"))
    (set-face-attribute
     'default nil
     :family "IosevkaTerm Nerd Font"
     :height 140)))

(my/apply-font)

(add-to-list
 'default-frame-alist
 '(font . "IosevkaTerm Nerd Font-14"))


;; ---------------------------------------------------------------------------
;; Terminal and tmux integration
;; ---------------------------------------------------------------------------

;; Enable mouse support when Emacs runs inside a terminal.
(unless (display-graphic-p)
  (xterm-mouse-mode 1))

;; tmux already has a very short escape-time. Do not introduce an additional
;; long Emacs escape delay.
(setq echo-keystrokes 0.1)

;; ESC should return to Evil normal state quickly.
(setq evil-esc-delay 0)

;; Improve terminal color handling.
(setq term-suppress-hard-newline t)

;; Use the system clipboard where the terminal/display environment supports it.
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Do not bind C-h/j/k/l globally in Emacs.
;;
;; vim-tmux-navigator uses those keys without the tmux prefix, so Emacs window
;; management is placed under SPC w instead.


;; ---------------------------------------------------------------------------
;; File behavior
;; ---------------------------------------------------------------------------

(setq require-final-newline t)
(setq create-lockfiles nil)

;; Keep backups and autosaves, but move them out of project directories.
(defconst my/backup-directory
  (expand-file-name "backups/" user-emacs-directory))

(defconst my/autosave-directory
  (expand-file-name "autosaves/" user-emacs-directory))

(make-directory my/backup-directory t)
(make-directory my/autosave-directory t)

(setq backup-directory-alist
      `(("." . ,my/backup-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,my/autosave-directory t)))

(setq auto-save-list-file-prefix
      (expand-file-name ".saves-" my/autosave-directory))

(setq backup-by-copying t)
(setq version-control t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)

;; Automatically reload files changed outside Emacs.
(global-auto-revert-mode 1)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Remember the last cursor position in files.
(save-place-mode 1)

;; Preserve minibuffer history.
(savehist-mode 1)

(setq history-length 200)

;; Keep a recent-file list.
(recentf-mode 1)

(setq recentf-max-saved-items 200)
(setq recentf-auto-cleanup 'never)


;; ---------------------------------------------------------------------------
;; Editing defaults
;; ---------------------------------------------------------------------------

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)

(setq sentence-end-double-space nil)

(delete-selection-mode 1)
(electric-pair-mode 1)

;; Long lines should not freeze redisplay.
(global-so-long-mode 1)

;; Make scripts executable after saving when they have a shebang.
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

;; Easier yes/no prompts.
(fset 'yes-or-no-p 'y-or-n-p)


;; ---------------------------------------------------------------------------
;; Scrolling
;; ---------------------------------------------------------------------------

(setq scroll-margin 5)
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position t)
(setq auto-window-vscroll nil)


;; ---------------------------------------------------------------------------
;; Evil
;; ---------------------------------------------------------------------------

(use-package evil
  :ensure t

  :init

  ;; Must be set before Evil loads.
  (setq evil-want-keybinding nil)

  ;; Vim-style C-u half-page scrolling.
  (setq evil-want-C-u-scroll t)

  ;; Vim-style C-d half-page scrolling.
  (setq evil-want-C-d-scroll t)

  ;; Y yanks from the cursor to the end of the line.
  (setq evil-want-Y-yank-to-eol t)

  ;; Search wraps around the file.
  (setq evil-search-wrap t)

  ;; New buffers start in normal state unless a mode says otherwise.
  (setq evil-default-state 'normal)

  ;; Use Vim-style undo when supported.
  (setq evil-undo-system 'undo-redo)

  :config

  (evil-mode 1)

  ;; Make j and k operate on visual lines.
  (evil-define-key '(normal visual motion) 'global
    (kbd "j") #'evil-next-visual-line
    (kbd "k") #'evil-previous-visual-line)

  ;; Preserve physical-line movement with gj/gk semantics reversed through
  ;; explicit mappings if needed.
  (evil-define-key '(normal visual motion) 'global
    (kbd "g j") #'evil-next-line
    (kbd "g k") #'evil-previous-line)

  ;; Escape also clears search highlighting.
  (define-key evil-normal-state-map
              (kbd "<escape>")
              #'keyboard-escape-quit))


;; ---------------------------------------------------------------------------
;; Evil support for built-in and external Emacs modes
;; ---------------------------------------------------------------------------

(use-package evil-collection
  :ensure t
  :after evil

  :init

  ;; Avoid configuring modes that are not installed.
  (setq evil-collection-mode-list
        '(bookmark
          buff-menu
          calendar
          compile
          dired
          ediff
          eldoc
          eshell
          grep
          help
          ibuffer
          info
          magit
          man
          occur
          package-menu
          project
          replace
          simple
          term
          vc-dir
          woman))

  :config
  (evil-collection-init))


;; ---------------------------------------------------------------------------
;; jk escape
;; ---------------------------------------------------------------------------

(use-package evil-escape
  :ensure t
  :after evil

  :custom

  (evil-escape-key-sequence "jk")
  (evil-escape-delay 0.2)

  :config

  (evil-escape-mode 1))


;; ---------------------------------------------------------------------------
;; Leader key
;; ---------------------------------------------------------------------------

;; SPC is used only in Evil normal, visual and motion states. It does not
;; conflict with tmux's C-a prefix or vim-tmux-navigator's C-h/j/k/l.

(defvar my/leader-map
  (make-sparse-keymap)
  "Personal leader key map.")

(defvar my/window-map
  (make-sparse-keymap)
  "Window management key map.")

(defvar my/file-map
  (make-sparse-keymap)
  "File management key map.")

(defvar my/buffer-map
  (make-sparse-keymap)
  "Buffer management key map.")

(defvar my/project-map
  (make-sparse-keymap)
  "Project management key map.")

(defvar my/help-map
  (make-sparse-keymap)
  "Help key map.")

(defvar my/git-map
  (make-sparse-keymap)
  "Git key map.")

(defvar my/toggle-map
  (make-sparse-keymap)
  "Toggle key map.")

(define-key my/leader-map (kbd "w") my/window-map)
(define-key my/leader-map (kbd "f") my/file-map)
(define-key my/leader-map (kbd "b") my/buffer-map)
(define-key my/leader-map (kbd "p") my/project-map)
(define-key my/leader-map (kbd "h") my/help-map)
(define-key my/leader-map (kbd "g") my/git-map)
(define-key my/leader-map (kbd "t") my/toggle-map)

(with-eval-after-load 'evil
  (evil-define-key '(normal visual motion) 'global
    (kbd "SPC") my/leader-map))


;; ---------------------------------------------------------------------------
;; Leader: files
;; ---------------------------------------------------------------------------

(define-key my/file-map (kbd "f") #'find-file)
(define-key my/file-map (kbd "s") #'save-buffer)
(define-key my/file-map (kbd "S") #'write-file)
(define-key my/file-map (kbd "r") #'recentf-open-files)
(define-key my/file-map (kbd "d") #'dired)
(define-key my/file-map (kbd "j") #'dired-jump)
(define-key my/file-map (kbd "e")
            (lambda ()
              (interactive)
              (find-file
               (expand-file-name "init.el" user-emacs-directory))))


;; ---------------------------------------------------------------------------
;; Leader: buffers
;; ---------------------------------------------------------------------------

(define-key my/buffer-map (kbd "b") #'switch-to-buffer)
(define-key my/buffer-map (kbd "i") #'ibuffer)
(define-key my/buffer-map (kbd "k") #'kill-current-buffer)
(define-key my/buffer-map (kbd "n") #'next-buffer)
(define-key my/buffer-map (kbd "p") #'previous-buffer)
(define-key my/buffer-map (kbd "r") #'revert-buffer)
(define-key my/buffer-map (kbd "s") #'save-some-buffers)


;; ---------------------------------------------------------------------------
;; Leader: Emacs windows
;; ---------------------------------------------------------------------------

;; These keys intentionally replace C-h/j/k/l for Emacs window movement.
;;
;; C-h/j/k/l remain available to vim-tmux-navigator for tmux panes.

(define-key my/window-map (kbd "h") #'windmove-left)
(define-key my/window-map (kbd "j") #'windmove-down)
(define-key my/window-map (kbd "k") #'windmove-up)
(define-key my/window-map (kbd "l") #'windmove-right)

(define-key my/window-map (kbd "v") #'split-window-right)
(define-key my/window-map (kbd "s") #'split-window-below)
(define-key my/window-map (kbd "d") #'delete-window)
(define-key my/window-map (kbd "o") #'delete-other-windows)
(define-key my/window-map (kbd "=") #'balance-windows)

(define-key my/window-map (kbd "H") #'shrink-window-horizontally)
(define-key my/window-map (kbd "L") #'enlarge-window-horizontally)
(define-key my/window-map (kbd "J") #'shrink-window)
(define-key my/window-map (kbd "K") #'enlarge-window)

;; Restore previous window layouts.
(winner-mode 1)

(define-key my/window-map (kbd "u") #'winner-undo)
(define-key my/window-map (kbd "r") #'winner-redo)


;; ---------------------------------------------------------------------------
;; Leader: project.el
;; ---------------------------------------------------------------------------

(require 'project)

(define-key my/project-map (kbd "p") #'project-switch-project)
(define-key my/project-map (kbd "f") #'project-find-file)
(define-key my/project-map (kbd "b") #'project-switch-to-buffer)
(define-key my/project-map (kbd "d") #'project-dired)
(define-key my/project-map (kbd "k") #'project-kill-buffers)
(define-key my/project-map (kbd "c") #'project-compile)
(define-key my/project-map (kbd "s") #'project-shell)
(define-key my/project-map (kbd "g") #'project-find-regexp)
(define-key my/project-map (kbd "!") #'project-shell-command)
(define-key my/project-map (kbd "&") #'project-async-shell-command)


;; ---------------------------------------------------------------------------
;; Leader: help
;; ---------------------------------------------------------------------------

;; C-h is occupied by vim-tmux-navigator in tmux, so help is exposed through
;; SPC h and the built-in F1 prefix.

(define-key my/help-map (kbd "k") #'describe-key)
(define-key my/help-map (kbd "f") #'describe-function)
(define-key my/help-map (kbd "v") #'describe-variable)
(define-key my/help-map (kbd "m") #'describe-mode)
(define-key my/help-map (kbd "b") #'describe-bindings)
(define-key my/help-map (kbd "p") #'describe-package)
(define-key my/help-map (kbd "i") #'info)
(define-key my/help-map (kbd "a") #'apropos-command)


;; ---------------------------------------------------------------------------
;; Leader: toggles
;; ---------------------------------------------------------------------------

(define-key my/toggle-map (kbd "l") #'display-line-numbers-mode)
(define-key my/toggle-map (kbd "w") #'visual-line-mode)
(define-key my/toggle-map (kbd "t") #'toggle-truncate-lines)
(define-key my/toggle-map (kbd "d") #'toggle-debug-on-error)


;; ---------------------------------------------------------------------------
;; Dired
;; ---------------------------------------------------------------------------

(use-package dired
  :ensure nil

  :commands
  (dired dired-jump)

  :custom

  ;; Reuse the same Dired buffer while navigating.
  (dired-kill-when-opening-new-dired-buffer t)

  ;; Human-readable sizes and grouped directories where supported.
  (dired-listing-switches "-alh --group-directories-first")

  :config

  ;; Refresh Dired automatically when files change.
  (setq dired-auto-revert-buffer t)

  ;; Guess the destination directory from another visible Dired window.
  (setq dired-dwim-target t))


;; ---------------------------------------------------------------------------
;; Minibuffer completion
;; ---------------------------------------------------------------------------

;; These packages are small and work through standard Emacs completion APIs.

(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

(use-package orderless
  :ensure t

  :custom

  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :after vertico
  :init
  (marginalia-mode 1))

(use-package consult
  :ensure t

  :bind

  (("M-y" . consult-yank-pop))

  :config

  (define-key my/buffer-map (kbd "b") #'consult-buffer)
  (define-key my/buffer-map (kbd "m") #'consult-buffer)
  (define-key my/file-map (kbd "r") #'consult-recent-file)
  (define-key my/project-map (kbd "g") #'consult-ripgrep)

  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global
      (kbd "/") #'consult-line)))


;; ---------------------------------------------------------------------------
;; In-buffer completion
;; ---------------------------------------------------------------------------

(use-package corfu
  :ensure t

  :custom

  (corfu-auto t)
  (corfu-auto-delay 0.15)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-preview-current nil)
  (corfu-quit-no-match 'separator)

  :init

  (global-corfu-mode 1))

;; Add terminal popup support for Corfu when the package is installed.
;;
;; The built-in overlay display is sufficient initially, so corfu-terminal is
;; intentionally not installed here.


;; ---------------------------------------------------------------------------
;; Syntax and diagnostics
;; ---------------------------------------------------------------------------

;; Show matching parentheses.
(show-paren-mode 1)

(setq show-paren-delay 0)

;; Built-in on-the-fly syntax checking.
(add-hook 'prog-mode-hook #'flymake-mode)

;; Do not constantly print Flymake diagnostics in the echo area.
(setq flymake-no-changes-timeout 0.5)

(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd "] d") #'flymake-goto-next-error
    (kbd "[ d") #'flymake-goto-prev-error))


;; ---------------------------------------------------------------------------
;; Eglot
;; ---------------------------------------------------------------------------

(use-package eglot
  :ensure nil
  :commands eglot eglot-ensure

  :custom

  ;; Do not take over formatting or indentation unless explicitly requested.
  (eglot-stay-out-of '(flymake))

  :config

  (define-key my/project-map (kbd "l") #'eglot)
  (define-key my/project-map (kbd "r") #'eglot-rename)
  (define-key my/project-map (kbd "a") #'eglot-code-actions)

  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global
      (kbd "g d") #'xref-find-definitions
      (kbd "g D") #'xref-find-definitions-other-window
      (kbd "g r") #'xref-find-references
      (kbd "K")   #'eldoc-doc-buffer)))


;; ---------------------------------------------------------------------------
;; Compilation
;; ---------------------------------------------------------------------------

(setq compilation-scroll-output 'first-error)
(setq compilation-always-kill t)
(setq compilation-ask-about-save nil)

(define-key my/leader-map (kbd "c") #'compile)

(with-eval-after-load 'evil
  (evil-define-key 'normal 'global
    (kbd "] e") #'next-error
    (kbd "[ e") #'previous-error))


;; ---------------------------------------------------------------------------
;; Shell
;; ---------------------------------------------------------------------------

(define-key my/leader-map (kbd "'") #'shell)

(defun my/project-eshell ()
  "Open Eshell in the current project root."
  (interactive)
  (let ((default-directory
         (if-let ((project (project-current)))
             (project-root project)
           default-directory)))
    (eshell t)))

(define-key my/project-map (kbd "e") #'my/project-eshell)


;; ---------------------------------------------------------------------------
;; Git
;; ---------------------------------------------------------------------------

(use-package magit
  :ensure t
  :commands magit-status

  :config

  (define-key my/git-map (kbd "g") #'magit-status)
  (define-key my/git-map (kbd "b") #'magit-blame-addition)
  (define-key my/git-map (kbd "l") #'magit-log-current))


;; ---------------------------------------------------------------------------
;; Theme
;; ---------------------------------------------------------------------------

(mapc #'disable-theme custom-enabled-themes)

(condition-case error-data
    (load-theme 'farout t)
  (error
   (message "Could not load the FarOut theme: %s"
            (error-message-string error-data))))


;; ---------------------------------------------------------------------------
;; Reload configuration
;; ---------------------------------------------------------------------------

(defun my/reload-init-file ()
  "Reload the current Emacs configuration."
  (interactive)
  (load-file
   (expand-file-name "init.el" user-emacs-directory))
  (message "Emacs configuration reloaded."))

(define-key my/file-map (kbd "R") #'my/reload-init-file)


;; ---------------------------------------------------------------------------
;; Key hints
;; ---------------------------------------------------------------------------

(use-package which-key
  :ensure t

  :custom

  (which-key-idle-delay 0.5)
  (which-key-idle-secondary-delay 0.05)

  :config

  (which-key-mode 1))


;; ---------------------------------------------------------------------------
;; Final startup behavior
;; ---------------------------------------------------------------------------

;; Open the scratch buffer in Lisp Interaction mode.
(setq initial-major-mode 'lisp-interaction-mode)

;; Do not split windows merely because a buffer name is long.
(setq even-window-sizes nil)

;; Keep the selected window visually obvious.
(setq highlight-nonselected-windows nil)

(provide 'init)

;;; init.el ends here
