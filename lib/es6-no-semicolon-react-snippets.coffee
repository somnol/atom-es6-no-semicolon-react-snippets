{CompositeDisposable} = require 'atom'

module.exports = Es6NoSemicolonReactSnippets =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily
    # cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'es6-no-semicolon-react-snippets:convert': => @convert()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  convert: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('Hello, world')
