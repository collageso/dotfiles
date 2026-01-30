(setq custom-file "~/.emacs.d/.emacs.custom.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(set-face-attribute 'default nil :family "IosevkaTerm Nerd Font" :height 140)
(add-to-list 'default-frame-alist '(font . "IosevkaTerm Nerd Font-14"))

(setq inhibit-splash-screen t)

(tool-bar-mode 0)   
(menu-bar-mode 0)   
(scroll-bar-mode 0) 

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)  

(use-package evil
  :ensure t      
  :config
  (evil-mode 1)
)

(use-package evil-escape
  :ensure t
  :after evil
  :config
  (setq evil-escape-key-sequence "jk")  
  (setq evil-escape-delay 0.2)         
  (evil-escape-mode 1))

(when (fboundp 'disable-theme)
  (mapc #'disable-theme custom-enabled-themes))

(load-theme 'farout t)
(load-file custom-file)

