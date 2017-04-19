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
  deleteNote: (note) ->
    notes = @state.notes.slice()
    index = notes.indexOf note
    notes.splice index, 1
    @replaceState notes: notes
  updateNote: (note, data) ->
    index = @state.notes.indexOf note
    notes = React.addons.update(@state.notes, {$splice: [[index, 1, data]]})
    @replaceState notes: notes
  render: ->
    React.DOM.div
      className: 'notes'
      React.DOM.h4
        className: 'title container center-div'
        'Enter Your Algorithm Here...'
      React.createElement NewNoteForm, handleNewNote: @addNote
      React.DOM.h2
        className: 'title center-text'
        'Algorithms'
      React.DOM.table
        className: 'table table-bordered bottom-buffer'
        React.DOM.thead null
              React.DOM.th null, 'Content'
              React.DOM.th
                className: 'actions-column'
                'Actions'
            React.DOM.tbody null
            for note in @state.notes
              React.createElement Note, key: note.id, note: note, handleDeleteNote: @deleteNote, handleEditNote: @updateNote
