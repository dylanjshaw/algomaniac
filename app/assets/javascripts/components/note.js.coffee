@Note = React.createClass
  render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.note.content
        React.DOM.td null 
