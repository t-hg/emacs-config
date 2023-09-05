;; edit-config
(defun edit-config ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))

;; reload-config
(defun reload-config ()
  "Reload the init file."
  (interactive)
  (load-file user-init-file))

;; GUI settings
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Global settings
(setq inhibit-startup-message t)
(setq make-backup-files nil)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Interactively DO things
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-separator "\n")
(ido-mode 1)

;; Add Milkypostman’s Emacs Lisp Package Archive
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; install packages
(defun install-packages ()
  "Install packages"
  (interactive)
  (package-refresh-contents)
  (package-install 'smex))

;; Smex is a M-x enhancement for Emacs. Built on top of Ido.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
