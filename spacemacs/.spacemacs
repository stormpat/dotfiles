;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration. You should not put any user code
   in this function besides modifying the variable values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     better-defaults
     emacs-lisp
     git
     evil-commentary
     evil-snipe
     ycmd
     vim-empty-lines
     haskell
     javascript
     react
     org
     php
     elixir
     vim-powerline
     themes-megapack
     (auto-completion
      :variables
      auto-completion-private-snippets-directory "~/.emacs.d/private/snippets/yasnippet-snippets"
      auto-completion-enable-sort-by-usage t
      auto-completion-enable-snippets-in-popup t
      auto-completion-enable-help-help-tooltip t)
     syntax-checking
     version-control
     html
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function. This function is called at the very startup
   of Spacemacs initialization before layers configuration.
   You should not put any user code in there besides modifying the variable values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(oldlace solarized-dark solarized-light)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; Approved: M+ 2m, Fira Mono
   dotspacemacs-default-font '("M+ 1mn"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun stormpat/web-mode-hook ()
  "Custom hooks for web-mode"
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-code-indent-offset 2)
  (setq-default web-mode-markup-indent-offset 2)
  )

;; Print the current file name to the buffer.
;; Useful when doing paths to files.
(defun u/add-current-file-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))

;; Live serach the spacemacs docs with helm.
(defun u/search-spacemacs-docs ()
  "Search the spacemacs docs using helm-do-ag"
  (interactive)
  (helm-do-ag "~/.emacs.d/doc/"))

(defun u/node-eval ()
  "Evaluate the current buffer (or region if mark-active),
   and return the result into another buffer,
   which is to be shown in a window."
  (interactive)
  (let ((debug-on-error t) (start 1) (end 1))
    (cond
     (mark-active
      (setq start (point))
      (setq end (mark)))
     (t
      (setq start (point-min))
      (setq end (point-max))))
    (call-process-region
     start end     ; seems the order does not matter
     "node"        ; node.js
     nil           ; don't delete region
     "*node.js*"     ; output buffer
     nil)          ; no redisply during output
    (message "Region or buffer evaluated!")
    (setq deactivate-mark t))) ; deactive the region, regardless


(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (set-variable 'ycmd-server-command `("python", (expand-file-name "~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/")))
  ;; (add-hook 'js2-mode-hook 'ycmd-mode)
  ;; (add-hook 'php-mode-hook 'ycmd-mode)
  ;; (setq ad-redefinition-action 'accept)
  ;; Limit the kill ring maximum size
  (setq kill-ring-max 10)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; Silence some js2-mode errors (instead lint with eslint)
  (setq-default js2-strict-trailing-comma-warning nil)
  (setq js2-highlight-external-variables nil)
  ;; We want company-mode enabled globally
  (global-company-mode)
  ;; Always truncate lines
  (setq-default truncate-lines t)
  ;; Disable smartparens
  (turn-off-show-smartparens-mode)
  ;; Simplyfy the GUI title
  (setq frame-title-format "M-x")
  ;; Paste behaviour
  (fset 'evil-visual-update-x-selection 'ignore)
  ;; Set powerline separators
  (setq powerline-default-separator 'arrow)
  ;; Enable line numbers as default in some modes
  ;;(add-to-hooks #'linum-mode '(js2-mode-hook))
  ;; Add web-mode as default when working with php files
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (setq-default company-idle-delay 0.0)
  ;; Set indents to two spaces, override some defaults.
  (setq-default js2-basic-offset 2)
  (setq-default css-indent-offset 2)
  (setq-default web-mode-markup-indent-offset 2)
  (setq tab-width 2)
  (setq-default flycheck-jshintrc "~/.jshintrc")
  (setq-default flycheck-jscsrc "~/.jscsrc")
  ;; Initialize web-mode custom hooks
  (add-hook 'web-mode-hook 'stormpat/web-mode-hook)
  ;; Set helm ignore folders
  ;;(add-to-list 'projectile-ignored-directories "node_modules")
  ;; Add haskell's cabal to path.
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-to-list 'exec-path "~/.local/bin/")
  ;; testing on osx pbpaste
  (setq x-select-enable-clipboard t)
  ;; Disable neotree vc-integration -> spacemacs/issues/2943
  (setq neo-vc-integration nil)
  ;; set fringe style to minimal (1px by 1px)
  (fringe-mode '(1 . 1))
  ;; Map keys to user customer functions [Use `m` for namespacing]
  ;; File related
  (evil-leader/set-key (kbd "omc") 'u/add-current-file-name)
  (evil-leader/set-key (kbd "omr") 'recentf-open-files)
  ;; Search related
  (evil-leader/set-key (kbd "omd") 'u/search-spacemacs-docs)
  ;; Git related
  (evil-leader/set-key (kbd "omx") 'magit-blame-quit)
  ;; Evalute JavaScript
  (evil-leader/set-key (kbd "oe") 'u/node-eval)
  ;; Buffer related (should be under o directly)
  (evil-leader/set-key (kbd "ol") 'avy-goto-line)
  (evil-leader/set-key (kbd "oc") 'avy-copy-line)
  (evil-leader/set-key (kbd "or") 'avy-copy-region)
  (evil-leader/set-key (kbd "oh") 'avy-goto-char-in-line)
  (evil-leader/set-key (kbd "on") 'spacemacs/new-empty-buffer)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
