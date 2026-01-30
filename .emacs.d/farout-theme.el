;;; farout-theme.el --- Farout color theme for Emacs

;; Copyright (C) 2026 collageso

;; Author: Generated based on farout.vim with extended package support
;; Version: 1.1

;;; Commentary:
;;
;; Dark, warm base-16 inspired colorscheme adapted from farout.vim.
;; Extended support for various packages following gruber-darker-theme structure.

(deftheme farout
  "Dark, warm base-16 inspired colorscheme adapted from farout.vim.")

;; Hex color definitions from farout.vim
;; Note: Farout has no pure Green or Blue.
;; Proxies used: Green -> Delimiter (#A4895C), Blue -> Identifier (#A67458)
(let ((farout-fg-main            "#E0CCAE")  ; Normal Foreground
      (farout-fg-bright          "#F2DDBC")  ; Constant, Directory, Title, Todo
      (farout-fg-special         "#a4896f")  ; Special
      (farout-bg-main            "#0F0908")  ; Normal Background
      (farout-bg-cursor          "#1F1311")  ; CursorLine, CursorColumn Background
      (farout-bg-modeline        "#291916")  ; StatusLine, Pmenu Background
      (farout-comment-color      "#6B4035")  ; Comment, LineNr, TabLine, Visual/Region BG
      (farout-non-text-color     "#66292F")  ; NonText, FoldColumn, SpellBad
      (farout-identifier-color   "#A67458")  ; Identifier, StatusLine FG, Cursor (Blue proxy)
      (farout-delimiter-color    "#A4895C")  ; Delimiter, DiffAdd (Green proxy)
      (farout-statement-color    "#F2A766")  ; Statement, TabLineSel (Orange/Yellow proxy)
      (farout-string-color       "#D47D49")  ; String, WildMenu (Darker Orange)
      (farout-number-color       "#8A4B53")  ; Number, Boolean (Pinkish/Magenta proxy)
      (farout-type-color         "#BF472C")  ; Error, PreProc, Type (Red)
      )

  (custom-theme-set-variables
   'farout
   '(frame-background-mode (quote dark)))

  (custom-theme-set-faces
   'farout

   ;; --------------------------------------------------------
   ;; 1. Basic Coloring & UI
   ;; --------------------------------------------------------
   `(default ((t (:foreground ,farout-fg-main :background ,farout-bg-main))))
   `(cursor ((t (:background ,farout-identifier-color :foreground ,farout-bg-main))))
   `(fringe ((t (:background ,farout-bg-main :foreground ,farout-non-text-color))))
   `(border ((t (:foreground ,farout-bg-cursor :background ,farout-bg-main))))
   `(vertical-border ((t (:foreground ,farout-bg-cursor))))
   `(minibuffer-prompt ((t (:foreground ,farout-statement-color :bold t))))
   `(region ((t (:background ,farout-comment-color :foreground ,farout-fg-main))))
   `(secondary-selection ((t (:background ,farout-comment-color :foreground nil))))
   `(shadow ((t (:foreground ,farout-comment-color))))
   `(trailing-whitespace ((t (:background ,farout-non-text-color))))
   `(tooltip ((t (:background ,farout-bg-modeline :foreground ,farout-fg-main))))
   `(link ((t (:foreground ,farout-fg-special :underline t))))
   `(link-visited ((t (:foreground ,farout-number-color :underline t))))
   `(match ((t (:background ,farout-bg-cursor :foreground ,farout-statement-color))))
   
   ;; --------------------------------------------------------
   ;; 2. Syntax Highlighting (Font Lock)
   ;; --------------------------------------------------------
   `(font-lock-builtin-face ((t (:foreground ,farout-type-color))))
   `(font-lock-comment-face ((t (:foreground ,farout-comment-color))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,farout-comment-color))))
   `(font-lock-constant-face ((t (:foreground ,farout-fg-bright))))
   `(font-lock-doc-face ((t (:foreground ,farout-comment-color))))
   `(font-lock-doc-string-face ((t (:foreground ,farout-comment-color))))
   `(font-lock-function-name-face ((t (:foreground ,farout-type-color))))
   `(font-lock-keyword-face ((t (:foreground ,farout-statement-color :bold t))))
   `(font-lock-negation-char-face ((t (:foreground ,farout-delimiter-color))))
   `(font-lock-preprocessor-face ((t (:foreground ,farout-type-color))))
   `(font-lock-string-face ((t (:foreground ,farout-string-color))))
   `(font-lock-type-face ((t (:foreground ,farout-type-color))))
   `(font-lock-variable-name-face ((t (:foreground ,farout-identifier-color))))
   `(font-lock-warning-face ((t (:foreground ,farout-type-color :bold t))))
   `(font-lock-number-face ((t (:foreground ,farout-number-color))))

   ;; --------------------------------------------------------
   ;; 3. Mode Line & Header
   ;; --------------------------------------------------------
   `(mode-line ((t (:background ,farout-bg-modeline :foreground ,farout-fg-main :box nil))))
   `(mode-line-buffer-id ((t (:weight bold :foreground ,farout-fg-bright))))
   `(mode-line-inactive ((t (:background ,farout-bg-cursor :foreground ,farout-comment-color :box nil))))
   `(header-line ((t (:inherit mode-line))))

   ;; --------------------------------------------------------
   ;; 4. Search & Isearch
   ;; --------------------------------------------------------
   `(isearch ((t (:foreground ,farout-bg-main :background ,farout-identifier-color))))
   `(isearch-fail ((t (:foreground ,farout-fg-bright :background ,farout-type-color))))
   `(isearch-lazy-highlight-face ((t (:foreground ,farout-statement-color :background ,farout-bg-cursor))))
   `(lazy-highlight ((t (:foreground ,farout-statement-color :background ,farout-bg-cursor))))

   ;; --------------------------------------------------------
   ;; 5. Diff & Ediff
   ;; --------------------------------------------------------
   `(diff-added ((t (:foreground ,farout-delimiter-color :background nil))))
   `(diff-removed ((t (:foreground ,farout-type-color :background nil))))
   `(diff-changed ((t (:foreground ,farout-statement-color))))
   `(diff-header ((t (:foreground ,farout-fg-special :background ,farout-bg-cursor))))
   `(diff-file-header ((t (:foreground ,farout-string-color :background ,farout-bg-cursor :bold t))))
   `(diff-context ((t (:foreground ,farout-comment-color))))

   ;; --------------------------------------------------------
   ;; 6. Compilation Mode
   ;; --------------------------------------------------------
   `(compilation-info ((t (:foreground ,farout-delimiter-color :bold t))))
   `(compilation-warning ((t (:foreground ,farout-statement-color :bold t))))
   `(compilation-error ((t (:foreground ,farout-type-color :bold t))))
   `(compilation-mode-line-fail ((t (:foreground ,farout-type-color :weight bold))))
   `(compilation-mode-line-exit ((t (:foreground ,farout-delimiter-color :weight bold))))

   ;; --------------------------------------------------------
   ;; 7. Magit
   ;; --------------------------------------------------------
   `(magit-branch ((t (:foreground ,farout-statement-color :bold t))))
   `(magit-diff-hunk-header ((t (:background ,farout-bg-cursor :foreground ,farout-identifier-color))))
   `(magit-diff-file-header ((t (:background ,farout-bg-modeline :foreground ,farout-fg-bright))))
   `(magit-diff-added ((t (:foreground ,farout-delimiter-color))))
   `(magit-diff-removed ((t (:foreground ,farout-type-color))))
   `(magit-section-highlight ((t (:background ,farout-bg-cursor))))
   `(magit-tag ((t (:foreground ,farout-string-color))))
   `(magit-log-author ((t (:foreground ,farout-identifier-color))))
   `(magit-log-sha1 ((t (:foreground ,farout-number-color))))

   ;; --------------------------------------------------------
   ;; 8. Helm & Company (Completion)
   ;; --------------------------------------------------------
   ;; Helm
   `(helm-source-header ((t (:foreground ,farout-statement-color :background ,farout-bg-modeline :weight bold :height 1.1))))
   `(helm-selection ((t (:background ,farout-bg-cursor))))
   `(helm-selection-line ((t (:background ,farout-bg-cursor))))
   `(helm-visible-mark ((t (:background ,farout-bg-modeline :foreground ,farout-statement-color))))
   `(helm-candidate-number ((t (:background ,farout-bg-main :foreground ,farout-number-color :bold t))))
   `(helm-ff-directory ((t (:foreground ,farout-fg-bright :weight bold))))
   `(helm-ff-executable ((t (:foreground ,farout-delimiter-color))))
   `(helm-ff-symlink ((t (:foreground ,farout-string-color))))

   ;; Company
   `(company-tooltip ((t (:foreground ,farout-fg-main :background ,farout-bg-modeline))))
   `(company-tooltip-annotation ((t (:foreground ,farout-delimiter-color :background ,farout-bg-modeline))))
   `(company-tooltip-selection ((t (:foreground ,farout-statement-color :background ,farout-bg-cursor))))
   `(company-scrollbar-bg ((t (:background ,farout-bg-cursor))))
   `(company-scrollbar-fg ((t (:background ,farout-identifier-color))))
   `(company-preview ((t (:background ,farout-bg-cursor))))
   `(company-preview-common ((t (:foreground ,farout-fg-bright :background ,farout-bg-cursor))))

   ;; --------------------------------------------------------
   ;; 9. Org Mode
   ;; --------------------------------------------------------
   `(org-agenda-structure ((t (:foreground ,farout-identifier-color :bold t))))
   `(org-agenda-date ((t (:foreground ,farout-statement-color))))
   `(org-agenda-done ((t (:foreground ,farout-delimiter-color))))
   `(org-level-1 ((t (:foreground ,farout-statement-color :bold t :height 1.1))))
   `(org-level-2 ((t (:foreground ,farout-type-color :bold t))))
   `(org-level-3 ((t (:foreground ,farout-string-color :bold t))))
   `(org-level-4 ((t (:foreground ,farout-identifier-color :bold t))))
   `(org-block ((t (:background ,farout-bg-cursor :foreground ,farout-fg-main))))
   `(org-block-begin-line ((t (:foreground ,farout-comment-color :background ,farout-bg-cursor))))
   `(org-block-end-line ((t (:inherit org-block-begin-line))))
   `(org-code ((t (:foreground ,farout-string-color))))
   `(org-done ((t (:foreground ,farout-delimiter-color :bold t))))
   `(org-todo ((t (:foreground ,farout-type-color :bold t))))
   `(org-date ((t (:foreground ,farout-fg-special :underline t))))
   `(org-link ((t (:foreground ,farout-fg-special :underline t))))
   `(org-column ((t (:background ,farout-bg-cursor))))
   `(org-column-title ((t (:background ,farout-bg-cursor :underline t :weight bold))))

   ;; --------------------------------------------------------
   ;; 10. Dired
   ;; --------------------------------------------------------
   `(dired-directory ((t (:foreground ,farout-fg-bright :weight bold))))
   `(dired-symlink ((t (:foreground ,farout-string-color))))
   `(dired-flagged ((t (:foreground ,farout-type-color))))
   `(dired-marked ((t (:foreground ,farout-statement-color))))
   `(dired-ignored ((t (:foreground ,farout-comment-color))))

   ;; --------------------------------------------------------
   ;; 11. Eshell & Terminal (Ansi-Term / Vterm)
   ;; --------------------------------------------------------
   `(eshell-prompt ((t (:foreground ,farout-statement-color :bold t))))
   `(eshell-ls-directory ((t (:foreground ,farout-fg-bright :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,farout-delimiter-color))))
   `(eshell-ls-symlink ((t (:foreground ,farout-string-color))))
   
   ;; Terminal Colors (Mapped to standard 8 colors using farout palette)
   `(term-color-black   ((t (:foreground ,farout-bg-modeline :background ,farout-bg-modeline))))
   `(term-color-red     ((t (:foreground ,farout-type-color :background ,farout-type-color))))
   `(term-color-green   ((t (:foreground ,farout-delimiter-color :background ,farout-delimiter-color)))) ; Proxy for green
   `(term-color-yellow  ((t (:foreground ,farout-statement-color :background ,farout-statement-color))))
   `(term-color-blue    ((t (:foreground ,farout-identifier-color :background ,farout-identifier-color)))) ; Proxy for blue
   `(term-color-magenta ((t (:foreground ,farout-number-color :background ,farout-number-color))))
   `(term-color-cyan    ((t (:foreground ,farout-string-color :background ,farout-string-color)))) ; Proxy for cyan
   `(term-color-white   ((t (:foreground ,farout-fg-main :background ,farout-fg-main))))

   ;; --------------------------------------------------------
   ;; 12. Flymake & Flyspell
   ;; --------------------------------------------------------
   `(flymake-error ((t (:underline (:style wave :color ,farout-type-color) :bold t))))
   `(flymake-warning ((t (:underline (:style wave :color ,farout-statement-color) :bold t))))
   `(flymake-note ((t (:underline (:style wave :color ,farout-delimiter-color) :bold t))))
   `(flyspell-incorrect ((t (:underline (:style wave :color ,farout-type-color)))))
   `(flyspell-duplicate ((t (:underline (:style wave :color ,farout-statement-color)))))

   ;; --------------------------------------------------------
   ;; 13. UI Elements (Line numbers, Parens, Whitespace)
   ;; --------------------------------------------------------
   `(highlight ((t (:background ,farout-bg-cursor :foreground nil))))
   `(hl-line ((t (:background ,farout-bg-cursor :foreground nil))))
   `(line-number ((t (:foreground ,farout-comment-color :background ,farout-bg-main))))
   `(line-number-current-line ((t (:foreground ,farout-identifier-color :background ,farout-bg-main))))
   
   `(show-paren-match ((t (:background ,farout-identifier-color :foreground ,farout-bg-main :bold t))))
   `(show-paren-mismatch ((t (:background ,farout-type-color :foreground ,farout-fg-main :bold t))))
   
   `(whitespace-space ((t (:background ,farout-bg-main :foreground ,farout-bg-modeline))))
   `(whitespace-tab ((t (:background ,farout-bg-main :foreground ,farout-bg-modeline))))
   `(whitespace-line ((t (:background ,farout-bg-cursor :foreground ,farout-type-color))))
   `(whitespace-trailing ((t (:background ,farout-non-text-color))))

   ;; --------------------------------------------------------
   ;; 14. Additional Packages (Ido, Which-func, Tab-bar)
   ;; --------------------------------------------------------
   ;; Ido
   `(ido-first-match ((t (:foreground ,farout-statement-color :bold t))))
   `(ido-only-match ((t (:foreground ,farout-delimiter-color :bold t))))
   `(ido-subdir ((t (:foreground ,farout-identifier-color))))
   `(ido-indicator ((t (:foreground ,farout-fg-main :background ,farout-type-color))))

   ;; Tab Bar
   `(tab-bar ((t (:background ,farout-bg-modeline :foreground ,farout-comment-color))))
   `(tab-bar-tab ((t (:background ,farout-bg-main :foreground ,farout-statement-color :bold t))))
   `(tab-bar-tab-inactive ((t (:background ,farout-bg-modeline :foreground ,farout-comment-color))))

   ;; Which Function
   `(which-func ((t (:foreground ,farout-identifier-color))))
   
   ;; AUCTeX (LaTeX)
   `(font-latex-bold-face ((t (:foreground ,farout-fg-bright :bold t))))
   `(font-latex-italic-face ((t (:foreground ,farout-fg-bright :italic t))))
   `(font-latex-math-face ((t (:foreground ,farout-number-color))))
   `(font-latex-sectioning-5-face ((t (:foreground ,farout-statement-color :bold t))))
   `(font-latex-string-face ((t (:foreground ,farout-string-color))))
   `(font-latex-warning-face ((t (:foreground ,farout-type-color))))

   ;; Markdown
   `(markdown-header-face ((t (:foreground ,farout-statement-color :bold t))))
   `(markdown-link-face ((t (:foreground ,farout-fg-special :underline t))))
   `(markdown-url-face ((t (:foreground ,farout-comment-color :underline t))))
   `(markdown-code-face ((t (:foreground ,farout-string-color))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'farout)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; farout-theme.el ends here.
