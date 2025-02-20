;; Custom Keybindings
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines)) ;; using M-/ for comments

(map! :leader :desc "Visit Buffer" "b o" #'ibuffer-visit-buffer) ;; open buffer from ibuffer listing

;; pyvenv mode keybinds
(map! :leader
      (:prefix ("v" . "venv") ;; new entry in whichkey
       :desc "Manually activate venv" "a" #'pyvenv-activate
       :desc "Deactivate venv" "d" #'pyvenv-activate
       :desc "Select venv (workon)" "w" #'pyvenv-workon))


;; keybinds for latex editing
(map! :leader
      :desc "LaTeX Commands" "l" nil ;; Reserve <SPC> l for LaTeX
      (:prefix ("l" . "LaTeX")
       :desc "Build LaTeX" "b" #'TeX-command-run-all
       :desc "View PDF" "v" #'TeX-view
       :desc "Preview in PDF" "p" #'latex-preview-pane-mode
       :desc "Select LaTeX engine" "e" #'TeX-engine-set
       ))
