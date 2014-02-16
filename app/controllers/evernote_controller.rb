class EvernoteController < ApplicationController

  def client
    evernote_user = User.find_by_id(current_user)
    ev_auth = evernote_user.linkedids.find_by_provider("evernote").token
    @client = EvernoteOAuth::Client.new(token: ev_auth)
    # binding.pry
  end

  def note_store
    @note_store = client.note_store
  end

  def create_notebook
    notebook = Evernote::EDAM::Type::Notebook.new
    notebook.name = "Test name to be replaced by params"
    created_notebook = note_store.createNotebook(notebook)


  end

  def create_note
    note = Evernote::EDAM::Type::Note.new
    note.title = "Title to be Replaced by a new title from params"
    note.notebookGuid ="16738da5-8c55-4a07-8d31-7e4d3c1a78a0"
    note.content = '<?xml version="1.0" encoding="UTF-8"?>' +
  '<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">' +
  '<en-note>'+'Here is the Evernote logo:' +
  '</en-note>'
    note.tagNames = ["tests"]

    note_store.createNote(note)

  end


end
