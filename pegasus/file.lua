local File = {
  isDir = function(path)
    local file = io.open(path, 'r')
    local ok, err, code = file:read(1)
    file:close()

    return code == 21
  end

  pathJoin = function(path, file)
    return table.concat({ path, file }, '/')
  end


 fileOpen = function(path)
    local filename = path

    if isDir(path) then
      filename = pathJoin(path, 'index.html')
    end

    local file = io.open(filename, 'r')

    if file then
        return file:read('*all')
    end

    return nil
  end
}

return File
