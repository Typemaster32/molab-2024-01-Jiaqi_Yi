# Assuming you're using a JavaScript environment or a library that can parse JS into an AST in Python
import esprima

def find_functions(js_code):
    ast = esprima.parseScript(js_code, { 'tolerant': True, 'range': True, 'loc': True })
    for node in esprima.parseScript(js_code).body:
        if node.type == 'FunctionDeclaration' and (node.id.name == 'draw' or node.id.name == 'setup'):
            # node.range gives you the start and end positions of the function in the code
            print(f"Function {node.id.name} found at range {node.range}")
