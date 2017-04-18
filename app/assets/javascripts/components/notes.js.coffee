@Notes = React.createClass
  getInitialState: ->
    notes: @props.data
  getDefaultProps: ->
    notes: []
  addNote: (note) ->
    # console.log('adding the note')
    notes = @state.notes.slice()
    notes.unshift(note)
    @setState(notes: notes)
    # console.log('added the note')
  render: ->
    React.DOM.div
      className: 'notes test'
      React.DOM.h2
        className: 'title test'
        'Notes'
      React.createElement NewNoteForm, handleNewNote: @addNote
      React.DOM.table
        className: 'table table-bordered test'
        React.DOM.thead null
          React.DOM.tr null
            React.DOM.th null, 'Content'
        React.DOM.tbody null
          for note in @state.notes
            React.createElement Note, key: note.id, note: note
            # React.createElement Delete
