# frozen_string_literal: true

module Jekyll
  ##
  # Monkeypatch for the Collection class
  class Collection
    def read_document(full_path)
      doc = Document.new(full_path, site: site, collection: self)
      doc.read
      docs << doc
    end
  end
end
