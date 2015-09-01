module MinistryDocs
  class Base
    protected

    def open_doc(path)
      open(path).read.encode('UTF-8', 'Windows-1251')
    end
  end
end