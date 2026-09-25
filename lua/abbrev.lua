local M = {}


local function abbrev(wrongs, correct)
  for _, wrong in ipairs(wrongs) do
    vim.cmd('iabbrev ' .. wrong .. ' ' .. correct)
  end
end
abbrev({ 'funciton', 'funtion', 'fnc', 'fnution' }, 'function')
abbrev({ 'retunr', 'retrun', 'retun' }, 'return')
abbrev({ 'flase', 'fals' }, 'false')
abbrev({ 'ture', 'treu' }, 'true')
abbrev({ 'tehn', 'thean' }, 'then')
abbrev({ 'esle', 'els' }, 'else')
abbrev({ 'cosnt', 'constante' }, 'const')
abbrev({ 'improt', 'improts' }, 'import')

abbrev({ 'lenght', 'lenth', 'lenght' }, 'length')

abbrev({ 'stirng', 'strnig' }, 'string')
abbrev({ 'numebr', 'numbe' }, 'number')
abbrev({ 'obect', 'obet', 'ojbect' }, 'object')
abbrev({ 'bollean', 'boolen' }, 'boolean')
abbrev({ 'exprots', 'exprot' }, 'export')

abbrev({ 'braek', 'brek' }, 'break')
abbrev({ 'contineu', 'contniue' }, 'continue')
abbrev({ 'switc', 'swithc' }, 'switch')
abbrev({ 'defualt', 'defulat' }, 'default')

abbrev({ 'asnyc', 'asny' }, 'async')
abbrev({ 'awiated', 'awaitng', 'awiart' }, 'await')

abbrev({ 'clasa', 'clss' }, 'class')
abbrev({ 'pacakge', 'packge' }, 'package')
abbrev({ 'moudle', 'moduel' }, 'module')

abbrev({ 'cahtc', 'catche' }, 'catch')
abbrev({ 'enviroment', 'enviornment' }, 'environment') -- O 'n' silencioso é sempre esquecido
abbrev({ 'initital', 'intial' }, 'initial')
abbrev({ 'configruation', 'configruare' }, 'configuration')
abbrev({ 'requset', 'reqeust' }, 'request')
abbrev({ 'repsone', 'responce' }, 'response')
abbrev({ 'paramters', 'params' }, 'parameters')
abbrev({ 'witdh', 'widh' }, 'width')
abbrev({ 'heigth', 'heigt' }, 'height')
abbrev({ 'whlie', 'wile', 'whil' }, 'while')
abbrev({ 'pulbic', 'pubilc', 'publc' }, 'public')
abbrev({ 'priavte', 'privte', 'privat' }, 'private')
abbrev({ 'statc', 'stiatic' }, 'static')
abbrev({ 'viud', 'viod' }, 'void')
abbrev({ 'interfac', 'intreface' }, 'interface')
abbrev({ 'implments', 'implemnts' }, 'implements')
abbrev({ 'extnds', 'exends' }, 'extends')
abbrev({ 'yeild', 'yild' }, 'yield')
abbrev({ 'suepr', 'supr' }, 'super')
abbrev({ 'constructer', 'costructor', 'construtor' }, 'constructor')

-- Tipos e Estruturas de Dados comuns
abbrev({ 'arary', 'arrary', 'arry' }, 'array')
abbrev({ 'integre', 'intger' }, 'integer')
abbrev({ 'flaot', 'flout' }, 'float')
abbrev({ 'doubel', 'doblue' }, 'double')
abbrev({ 'undefind', 'undfined' }, 'undefined')
abbrev({ 'dictonary', 'dictionay' }, 'dictionary')

-- Globais e Operadores
abbrev({ 'instnaceof', 'instaceof' }, 'instanceof')
abbrev({ 'typefo', 'tyepof' }, 'typeof')
abbrev({ 'documnet', 'docment' }, 'document')
abbrev({ 'widnow', 'windwo' }, 'window')
abbrev({ 'gloabl', 'globla' }, 'global')
abbrev({ 'loacl', 'locla' }, 'local')

-- Nomes de variáveis/propriedades quase universais
abbrev({ 'idnex', 'indxe' }, 'index')
abbrev({ 'vlaue', 'valeu' }, 'value')
abbrev({ 'cuont', 'coutn' }, 'count')
abbrev({ 'messege', 'mesage' }, 'message')
abbrev({ 'eror', 'errro' }, 'error')
abbrev({ 'evnet', 'evnt' }, 'event')
abbrev({ 'hander', 'hnalder' }, 'handler')
abbrev({ 'maht', 'mtha' }, 'math')
abbrev({ 'radnom', 'randmo' }, 'random')
abbrev({ 'buttn', 'bton', 'buuton' }, 'button')

abbrev({ 'arrow', 'arrf' }, '=>')


return M
