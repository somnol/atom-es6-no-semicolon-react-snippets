{CompositeDisposable} = require 'atom'

module.exports = AtomEs6NoSemicolonStyleReact =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-es6-no-semicolon-style-react:toggle': => @toggle()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  toggle: ->
    console.log 'AtomEs6NoSemicolonStyleReact was toggled!'
